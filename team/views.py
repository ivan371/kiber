from __future__ import absolute_import
from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.response import Response

from app.api import router
from .models import Team, UserTeam
from .serializers import TeamSerializer, TeamUserSerializer, UserTeamSerializer, TeamUserWriteSerializer, \
    UserTeamWriteSerializer
from itertools import chain


class TeamViewSet(viewsets.ModelViewSet):
    queryset = Team.objects.all().order_by('-id').prefetch_related('admin')
    serializer_class = TeamSerializer

    def perform_create(self, serializer):
        serializer.save(admin=self.request.user)

    def get_queryset(self):
        queryset = super(TeamViewSet, self).get_queryset()
        if hash(self.request.user.username) % 2 == 0:
            queryset = queryset.using('db1')
        else:
            queryset = queryset.using('db2')
        return queryset


class TeamUserViewSet(viewsets.ModelViewSet):
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
        if 'team' in self.request.query_params:
            if self.request.query_params['team'].isdigit:
                if hash(self.request.user.username) % 2 == 0:
                    serializer.save(team_id=self.request.query_params['team'], using='db1')
                else:
                    serializer.save(team_id=self.request.query_params['team'], using='db2')
        else:
            if hash(self.request.user.username) % 2 == 0:
                serializer.save(user=self.request.user, using='db1')
            else:
                serializer.save(user=self.request.user, using='db2')

    def get_queryset(self):
        queryset = super(TeamUserViewSet, self).get_queryset()
        if 'team' in self.request.query_params:
            if self.request.query_params['team'].isdigit():
                queryset = list(chain(UserTeam.objects.filter(team=self.request.query_params['team']).using('db1')
                                      .prefetch_related('user'),
                                      UserTeam.objects.filter(team=self.request.query_params['team']).using('db2')
                                      .prefetch_related('user')))
                queryset = list(set(queryset))
        else:
            if hash(self.request.user.username) % 2 == 0:
                queryset = queryset.using('db1')
            else:
                queryset = queryset.using('db2')
            queryset = queryset.filter(user=self.request.user).prefetch_related('team')
        return queryset

router.register('teams', TeamViewSet)
router.register('teamuser', TeamUserViewSet)