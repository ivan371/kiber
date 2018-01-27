from django.contrib.auth.models import User
from django.db import models


class Team(models.Model):
    name = models.CharField(max_length=100)
    admin = models.ForeignKey(User, on_delete=True)
    games = models.IntegerField(default=0)
    avatar = models.ImageField(upload_to='avatars', blank=True, null=True)

    def __str__(self):
        return self.name


class UserTeam(models.Model):
    name = models.CharField(max_length=100)
    team = models.ForeignKey(Team, on_delete=True)
    user = models.ForeignKey(User, on_delete=True)

