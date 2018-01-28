from django.db import models

from match.models import Match
from team.models import Team


class Game(models.Model):
    name = models.CharField(max_length=100, unique=True)
    winner = models.ForeignKey(Team, on_delete=True, null=True, blank=True)
    match = models.ForeignKey(Match, on_delete=True)

    def __str__(self):
        return self.name


class GameTeam(models.Model):
    team = models.ForeignKey(Team, on_delete=True)
    game = models.ForeignKey(Game, on_delete=True)
    is_winner = models.BooleanField(default=False)