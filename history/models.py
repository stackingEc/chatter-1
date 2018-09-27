from django.db import models
from django.contrib.auth.models import User
import datetime
from profiles.models import Profile


# Create your models here.
class Groups(models.Model):
    name = models.CharField(max_length=20)
    type = models.CharField(max_length=20)
    date = models.DateTimeField(default=datetime.datetime.now().strftime("%Y-%m-%d %H:%M"))

    def __str__(self):
        return self.date


class ChatHistory(models.Model):
    group = models.ForeignKey(Groups, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    message = models.CharField(max_length=140)
    date = models.DateTimeField(default=datetime.datetime.now().strftime("%Y-%m-%d %H:%M"))

    def __str__(self):
        return self.date


class PersonalMessage(models.Model):
    user_sender = models.ForeignKey(User, on_delete=models.CASCADE)
    profile_reciver = models.ForeignKey(Profile, on_delete=models.CASCADE)
    message = models.CharField(max_length=1000)
    date = models.DateTimeField(default=datetime.datetime.now().strftime("%Y-%m-%d %H:%M"))

    def __str__(self):
        return self.date
