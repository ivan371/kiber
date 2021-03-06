from django.contrib.auth.models import User
from django.db import models


class Team(models.Model):
    name = models.CharField(max_length=100)
    games = models.IntegerField(default=0)
    avatar = models.ImageField(upload_to='avatars', default='game.png')

    def __str__(self):
        return self.name


class UserTeam(models.Model):
    team = models.ForeignKey(Team, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

