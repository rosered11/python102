from django.db import models
from datetime import datetime

class Tweet(models.Model):
    id = models.AutoField(primary_key=True)
    body = models.CharField(max_length=100,null=True)
    author = models.CharField(max_length=100,null=True)
    owner = models.CharField(max_length=100,null=True)
    is_retweet = models.BooleanField(default=False)
    created_at = models.DateTimeField(default=datetime.now, blank=True)
    updated_at = models.DateTimeField(default=datetime.now, blank=True)
    class Meta:
        ordering = ['id']


class User(models.Model):
    id = models.IntegerField(primary_key=True)
    email = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()