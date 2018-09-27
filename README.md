Install rabbitmq 
Import database from the database folder all.sql
Install requirements
Install Python 3.5 or grater
pip3 install -r requirements.txt
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py

In the folder websockets run the next command
node install --save-dev
node index.js

For the messaging between rabbitmq should set up a cron job in linux to run at certain time it should not run at the same time is created because it should run independent from the application.
The file will be created along side of manage.py, the names of the files are receive.py, end.py, csv_file.py

execute 

python3 receive.py
python3 send.py
python3 csv_file.py

The url to the project 
http://127.0.0.1:8000/

please use the following users
dave@gmail.com
crack@live.com

Password  for both
Iamtheone1?


