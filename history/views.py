import os
from django.shortcuts import render
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse, HttpResponseRedirect
from history.models import ChatHistory, Groups
from django.contrib.auth.decorators import login_required
import json
import string
from django.utils.crypto import get_random_string
from django.http import JsonResponse

@login_required
def chat_history(request):
    context = {
        'messages': ChatHistory.objects.all(),
        'type_chat': Groups.objects.all()
    }
    return render(request, 'chat.html', context)


@csrf_exempt
def save_message(request):
    if request.method == 'POST':
        msg_obj = json.loads(request.body.decode('utf-8'))
        try:
            us = int(msg_obj['name'])
            group = int(msg_obj['type'])
            user_id = User.objects.get(id=us)
            group_id = Groups.objects.get(id=group)
            msg = ChatHistory.objects.create(group=group_id, user=user_id, message=msg_obj['message'])
            msg.save()
        except:
            return HttpResponse("error")
        return HttpResponse("success")
    else:
        return HttpResponseRedirect('/')

@login_required
def history_by_type(request):
    if request.is_ajax():
        data = int(request.GET.get('csrfmiddlewaretoken', None))
        context = {
            'messages': ChatHistory.objects.filter(group=data),
            'type_chat': Groups.objects.all()
        }
        if (context):
            return render(request, 'chat.html', context)
        else:
            return 'this product doesnt exists 1'

    else:
        return HttpResponseRedirect('/chat/')


@login_required
def queue_message(request):
    if request.is_ajax():
        data = request.GET.get('csrfmiddlewaretoken', None)
        print(data)
        if (data):

            receive = open("receive.py", "w")
            one = """
#!/usr/bin/env python
import pika


connection = pika.BlockingConnection(pika.ConnectionParameters(
    host='localhost'))
channel = connection.channel()
channel.queue_declare(queue='{0}')


def callback(ch, method, properties, body):
    if (body is None):
        print(" [x] null")
    else:
        print(" [x] Received --** %r " %body)


channel.basic_consume(callback, queue='{0}', no_ack=True)

print(' [*] Waiting for messages. To exit press CTRL+C')
channel.start_consuming()""".format(data)

            receive.write(one)
            send = open("send.py", "w")

            two = """ 
#!/usr/bin/env python
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='localhost'))
channel = connection.channel()


channel.queue_declare(queue='{0}')

channel.basic_publish(exchange='', routing_key='hello', body='Hello World!')
print(" [x] Sent 'Hello World!'")
connection.close()            
            """.format(data)
            send.write(one)

            data_retievar = open("csv_file.py", "w")
            data_csv ="""
import pandas as pd
df = pd.read_csv('aapl.us.csv')
a = df[df.Symbol == '{0}']
log = open("log.txt", "w")
log.write(a)
conn = psycopg2.connect(host="localhost", database="chat", user="root", password="Admin14801612")
cur = conn.cursor()
cur.execute("INSERT INTO history_personalmessage VALUES (1, '"+str(a)+"', '2018-07-03 10:00:00', 1, 2)")
conn.commit()
cur.close()
conn.close()         
            """.format(data)
            data_retievar.write(data_csv)
            cmd = """
#!/usr/bin/env bash
python3 receive.py
python3 send.py
python3 csv_file.py

            """
            os.system(cmd)
            return 'DONE'

        else:
            return 'this product doesnt exists 1'

    else:
        return HttpResponseRedirect('/chat/')
