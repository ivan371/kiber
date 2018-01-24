from django.db import models

from team.models import Team


class Game(models.Model):
    name = models.CharField(max_length=100)
    winner = models.ForeignKey(Team, on_delete=True, null=True)

    def __str__(self):
        return self.name


class GameTeam(models.Model):
    team = models.ForeignKey(Team, on_delete=True)
    game = models.ForeignKey(Game, on_delete=True)
