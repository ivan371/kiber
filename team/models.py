from django.contrib.auth.models import User
from django.db import models


class Team(models.Model):
    name = models.CharField(max_length=100)
    admin = models.ForeignKey(User, on_delete=True)

    def __str__(self):
        return self.name


class UserTeam(models.Model):
    team = models.ForeignKey(Team, on_delete=True)
    user = models.ForeignKey(User, on_delete=True)

