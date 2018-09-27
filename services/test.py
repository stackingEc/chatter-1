import pandas as pd
import psycopg2


df = pd.read_csv('aapl.us.csv')
a = df[df.Symbol == 'AAPL']
log = open("log.txt", "w")
log.write(str(a))
conn = psycopg2.connect(host="localhost", database="chat", user="root", password="Admin14801612")
cur = conn.cursor()
cur.execute("INSERT INTO history_personalmessage VALUES (1, '"+str(a)+"', '2018-07-03 10:00:00', 1, 2)")
conn.commit()
cur.close()
conn.close()