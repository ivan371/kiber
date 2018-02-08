from __future__ import absolute_import
from django.shortcuts import render, get_object_or_404
from rest_framework import viewsets, permissions
from rest_framework.response import Response
from oauth2_provider.contrib.rest_framework import TokenHasReadWriteScope, TokenHasScope


from app.api import router
from app.views import test_connection_to_db, ShardingViewSet
from .models import Team, UserTeam
from .serializers import TeamSerializer, TeamUserSerializer, UserTeamSerializer, TeamUserWriteSerializer, \
    UserTeamWriteSerializer
from itertools import chain


class TeamViewSet(ShardingViewSet):
    queryset = Team.objects.all().order_by('-id')
    serializer_class = TeamSerializer
    # permission_classes = [permissions.IsAuthenticated, TokenHasReadWriteScope]

    def perform_create(self, serializer):
        if test_connection_to_db('db1') and test_connection_to_db('db2'):
            serializer.save(using='all')

    def perform_update(self, serializer):
        if test_connection_to_db('db1') and test_connection_to_db('db2'):
            serializer.save(using='all')

    def get_queryset(self):
        queryset = super(TeamViewSet, self).get_queryset()
        if test_connection_to_db('db2'):
            if test_connection_to_db('db1'):
                queryset = queryset.using('db2')
            else:
                queryset = queryset.using('db1')
        else:
            queryset = queryset.using('db1')
        return queryset


class TeamUserViewSet(ShardingViewSet):
    queryset = UserTeam.objects.all()
    serializer_class = TeamUserSerializer

    def get_serializer_class(self):
        if self.request.method == 'POST':
            if 'team' not in self.request.query_params:
                return UserTeamWriteSerializer
            return TeamUserWriteSerializer
        else:
            if 'team' in self.request.query_params:
                return UserTeamSerializer
            return TeamUserSerializer

    def perform_create(self, serializer):
        if test_connection_to_db('db1') and test_connection_to_db('db2'):
            if 'team' in self.request.query_params:
                if self.request.query_params['team'].isdigit:
                    # if hash(self.request.user.username) % 2 == 0:
                    #     serializer.save(team_id=self.request.query_params['team'], using='db1')
                    # else:
                    #     serializer.save(team_id=self.request.query_params['team'], using='db2')
                    if self.request.user.id % 2 == 0:
                        serializer.save(team_id=self.request.query_params['team'], using='db2')
                    else:
                        serializer.save(team_id=self.request.query_params['team'], using='db1')
            else:
                # if hash(self.request.user.id) % 2 == 0:
                #     serializer.save(user=self.request.user, using='db1')
                # else:
                #     serializer.save(user=self.request.user, using='db2')
                serializer.save(user=self.request.user, using='all')

    def perform_update(self, serializer):
        if test_connection_to_db('db1') and test_connection_to_db('db2'):
            serializer.save(using='all')

    def get_queryset(self):
        queryset = super(TeamUserViewSet, self).get_queryset()
        if 'team' in self.request.query_params:
            if self.request.query_params['team'].isdigit():
                # queryset = UserTeam.objects.all().using('db1').filter(team=self.request.query_params['team'])\
                #     .select_related('user')
                # qs = UserTeam.objects.all().using('db2').filter(team=self.request.query_params['team'])\
                #     .select_related('user')
                # # queryset = (qs | queryset).distinct()\
                # #     .filter(team=self.request.query_params['team']).prefetch_related('user')
                # print(self.kwargs)
                # return list(set(chain(qs, queryset)))
                queryset = queryset.filter(team=self.request.query_params['team']).prefetch_related('user')
                if test_connection_to_db('db2'):
                    queryset = queryset.using('db2')
                else:
                    queryset = queryset.using('db1')
        else:
            if self.request.user.id % 2 == 0:
                if test_connection_to_db('db1'):
                    queryset = queryset.using('db1')
                else:
                    queryset = queryset.using('db2')
            else:
                if test_connection_to_db('db2'):
                    queryset = queryset.using('db2')
                else:
                    queryset = queryset.using('db1')
            queryset = queryset.filter(user=self.request.user).prefetch_related('team')
        return queryset

router.register('teams', TeamViewSet)
router.register('teamuser', TeamUserViewSet)