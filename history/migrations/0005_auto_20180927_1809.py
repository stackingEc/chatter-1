# Generated by Django 2.1.1 on 2018-09-27 18:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('history', '0004_auto_20180927_1806'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chathistory',
            name='date',
            field=models.DateTimeField(default='2018-09-27 18:09'),
        ),
        migrations.AlterField(
            model_name='groups',
            name='date',
            field=models.DateTimeField(default='2018-09-27 18:09'),
        ),
        migrations.AlterField(
            model_name='personalmessage',
            name='date',
            field=models.DateTimeField(default='2018-09-27 18:09'),
        ),
    ]
