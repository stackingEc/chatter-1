#!/usr/bin/env python
import pika


connection = pika.BlockingConnection(pika.ConnectionParameters(
    host='localhost'))
channel = connection.channel()
channel.queue_declare(queue='bye')


def callback(ch, method, properties, body):
    if (body is None):
        print(" [x] null")
    else:
        print(" [x] Received --** {0}".format(body))


channel.basic_consume(callback,
                      queue='bye',
                      no_ack=True)

print(' [*] Waiting for messages. To exit press CTRL+C')
channel.start_consuming()
