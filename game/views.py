from __future__ import absolute_import
from django.shortcuts import render, get_object_or_404
from rest_framework import viewsets

from app.api import router
from app.views import test_connection_to_db, ShardingViewSet
from game.serizlizers import GameSerializer, GameTeamSerializer, TeamGameSerializer, GameSimpleSerializer
from team.models import Team
from .models import Game, GameTeam


class GameViewSet(ShardingViewSet):
    queryset = Game.objects.all()
    serializer_class = GameSimpleSerializer

    def perform_create(self, serializer):
        if hash(serializer.validated_data['name']) % 2 == 0:
            serializer.save(using='db1')
        else:
            serializer.save(using='db2')

    def get_queryset(self):
        if test_connection_to_db('db2'):
            queryset = Game.objects.using('db2')
        else:
            queryset = Game.objects.using('db1')
        # qs = Game.objects.using('db2')
        # queryset = (qs | queryset).distinct()
        if 'match' in self.request.query_params:
            if self.request.query_params['match'].isdigit:
                queryset = queryset.filter(match_id=self.request.query_params['match'])
        return queryset


class GameTeamViewSet(viewsets.ModelViewSet):
    queryset = GameTeam.objects.all()
    serializer_class = GameTeamSerializer

    def get_serializer_class(self):
        if self.request.method == 'POST':
            if 'game' in self.request.query_params:
                return GameTeamSerializer
            else:
                return TeamGameSerializer
        else:
            if 'game' in self.request.query_params:
                return TeamGameSerializer
            else:
                return GameTeamSerializer

    def perform_create(self, serializer):
        if 'game' in self.request.query_params:
            if hash(Game.objects.get(id=self.request.query_params['game']).name) % 2 == 0:
                serializer.save(game_id=self.request.query_params['game'], using='db1')
            else:
                serializer.save(game_id=self.request.query_params['game'], using='db2')
        elif 'team' in self.request.query_params:
            print(serializer.validated_data)
            if hash(serializer.validated_data['game'].name) % 2 == 0:
                serializer.save(team_id=self.request.query_params['team'], using='db1')
            else:
                serializer.save(team_id=self.request.query_params['team'], using='db2')

    def get_queryset(self):
        queryset = super(GameTeamViewSet, self).get_queryset()
        if 'game' in self.request.query_params:
            if self.request.query_params['game'].isdigit():
                queryset = queryset.filter(game_id=self.request.query_params['game'])
                if hash(Game.objects.get(id=self.request.query_params['game']).name) % 2 == 0:
                    queryset = queryset.using('db1')
                else:
                    queryset = queryset.using('db2')
                queryset = queryset.select_related('team', 'game')
            else:
                return GameTeam.objects.none()
        elif 'team' in self.request.query_params:
            if self.request.query_params['team'].isdigit():
                queryset = GameTeam.objects.all().using('db1')
                qs = GameTeam.objects.all().using('db2')
                queryset = (qs | queryset).distinct()
                queryset = queryset.filter(team_id=self.request.query_params['team']).select_related('game')
            else:
                return GameTeam.objects.none()
        else:
            return GameTeam.objects.none()
        return queryset

router.register('games', GameViewSet)
router.register('gameteam', GameTeamViewSet)