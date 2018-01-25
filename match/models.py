from django.db import models

from turn.models import Turn


class Match(models.Model):
    name = models.CharField(max_length=100)
    turn = models.ForeignKey(Turn, on_delete=True)

    def __str__(self):
        return self.name