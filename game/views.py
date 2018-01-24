from __future__ import absolute_import
from django.shortcuts import render
from rest_framework import viewsets

from app.api import router
from game.serizlizers import GameSerializer
from .models import Game


class GameViewSet(viewsets.ModelViewSet):
    queryset = Game.objects.all()
    serializer_class = GameSerializer


router.register('games', GameViewSet)
