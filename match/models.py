from datetime import datetime
from django.db import models

from turn.models import Turn


class Match(models.Model):
    name = models.CharField(max_length=100)
    turn = models.ForeignKey(Turn, on_delete=True)
    games = models.IntegerField(default=0)
    avatar = models.ImageField(upload_to='avatars', default='match.png')
    date = models.DateField(default=datetime.now)

    def __str__(self):
        return self.name
