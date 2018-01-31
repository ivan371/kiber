from datetime import datetime

from django.db import models

from match.models import Match
from team.models import Team


class Game(models.Model):
    name = models.CharField(max_length=100, unique=True)
    match = models.ForeignKey(Match, on_delete=models.CASCADE)
    date = models.DateField(default=datetime.now)

    def __str__(self):
        return self.name


class GameTeam(models.Model):
    team = models.ForeignKey(Team, on_delete=models.CASCADE)
    game = models.ForeignKey(Game, on_delete=models.CASCADE)
    is_winner = models.BooleanField(default=False)