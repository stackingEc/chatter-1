# Generated by Django 2.1.1 on 2018-09-27 17:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('profiles', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='date_inserted',
            field=models.DateTimeField(default='2018-09-27 17:58'),
        ),
    ]
