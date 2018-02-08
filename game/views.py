from __future__ import absolute_import

import random

from django.shortcuts import render, get_object_or_404
from oauth2_provider.contrib.rest_framework import TokenHasReadWriteScope
from rest_framework import viewsets, permissions

from app.api import router
from app.views import test_connection_to_db, ShardingViewSet
from game.serizlizers import GameSerializer, GameTeamSerializer, TeamGameSerializer, GameSimpleSerializer
from generate.generate import get_pk
from team.models import Team
from .models import Game, GameTeam


class GameViewSet(ShardingViewSet):
    queryset = Game.objects.all()
    serializer_class = GameSimpleSerializer
    # permission_classes = [permissions.IsAuthenticated, TokenHasReadWriteScope]

    def perform_create(self, serializer):
        if test_connection_to_db('db1') and test_connection_to_db('db2'):
            ran_db = random.randint(1, 2)
            serializer.save(using=ran_db, id=int(get_pk() + str(ran_db)))
            # if hash(serializer.validated_data['name']) % 2 == 0:
            #     serializer.save(using='db1')
            # else:
            #     serializer.save(using='db2')

    def perform_update(self, serializer):
        if test_connection_to_db('db1') and test_connection_to_db('db2'):
            db = self.get_object().id
            serializer.save(using=db%2)

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
                if test_connection_to_db('db2'):
                    if test_connection_to_db('db1'):
                        if int(self.request.query_params['match']) % 2 == 0:
                            queryset = queryset.using('db1')
                        else:
                            queryset = queryset.using('db2')
                    else:
                        queryset = queryset.using('db2')
                else:
                    queryset = queryset.using('db1')
        return queryset


class GameTeamViewSet(ShardingViewSet):
    queryset = GameTeam.objects.all()
    serializer_class = GameTeamSerializer
    # permission_classes = [permissions.IsAuthenticated, TokenHasReadWriteScope]

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
        if test_connection_to_db('db1') and test_connection_to_db('db2'):
            if 'game' in self.request.query_params:
                # if hash(Game.objects.get(id=self.request.query_params['game']).name) % 2 == 0:
                #     serializer.save(game_id=self.request.query_params['game'], using='db1')
                # else:
                #     serializer.save(game_id=self.request.query_params['game'], using='db2')
                if int(self.request.query_params['game']) % 2 == 0:
                    serializer.save(game_id=self.request.query_params['game'], using='db2')
                else:
                    serializer.save(game_id=self.request.query_params['game'], using='db1')
                # time = datetime.datetime.now()
                # int(time.strftime("%Y%m%d%H%M%S"))
                # random.randint(0, 100)
            elif 'team' in self.request.query_params:
                # print(serializer.validated_data)
                # if hash(serializer.validated_data['game'].name) % 2 == 0:
                #     serializer.save(team_id=self.request.query_params['team'], using='db1')
                # else:
                #     serializer.save(team_id=self.request.query_params['team'], using='db2')
                if serializer.validated_data['game'].id % 2 == 0:
                    serializer.save(team_id=self.request.query_params['team'], using='db2')
                else:
                    serializer.save(team_id=self.request.query_params['team'], using='db1')

    def perform_update(self, serializer):
        if test_connection_to_db('db1') and test_connection_to_db('db2'):
            serializer.save(using='all')

    def get_queryset(self):
        queryset = super(GameTeamViewSet, self).get_queryset()
        if 'game' in self.request.query_params:
            if self.request.query_params['game'].isdigit():
                queryset = queryset.filter(game_id=self.request.query_params['game'])
                if test_connection_to_db('db2'):
                    if test_connection_to_db('db1'):
                        if int(self.request.query_params['game']) % 2 == 0:
                            queryset = queryset.using('db1')
                        else:
                            queryset = queryset.using('db2')
                    else:
                        queryset = queryset.using('db2')
                else:
                    queryset = queryset.using('db1')
                queryset = queryset.select_related('team', 'game')
            else:
                return GameTeam.objects.none()
        elif 'team' in self.request.query_params:
            if self.request.query_params['team'].isdigit():
                # queryset = GameTeam.objects.all().using('db1')
                # qs = GameTeam.objects.all().using('db2')
                # queryset = (qs | queryset).distinct()
                if test_connection_to_db('db2'):
                    if test_connection_to_db('db1'):
                        if int(self.request.query_params['team']) % 2 == 0:
                            queryset = queryset.using('db1')
                        else:
                            queryset = queryset.using('db2')
                    else:
                        queryset = queryset.using('db2')
                else:
                    queryset = queryset.using('db1')
                queryset = queryset.filter(team_id=self.request.query_params['team']).select_related('game')
            else:
                return GameTeam.objects.none()
        else:
            return GameTeam.objects.none()
        return queryset


router.register('games', GameViewSet)
router.register('gameteam', GameTeamViewSet)
