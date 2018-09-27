from django.db import models
from django.contrib.auth.models import User
import datetime


# Create your models here.
class Profile(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    number = models.CharField(max_length=50)
    date_of_birth = models.DateTimeField()
    date_inserted = models.DateTimeField(default=datetime.datetime.now().strftime("%Y-%m-%d %H:%M"))
    image = models.CharField(max_length=250, null=True, blank=True)

    def __str__(self):
        return self.number