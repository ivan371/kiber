from __future__ import absolute_import
from django.shortcuts import render
from rest_framework import viewsets

from app.api import router
from .models import Team, UserTeam
from .serializers import TeamSerializer, TeamUserSerializer, UserTeamSerializer
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
        if 'team' in self.request.query_params:
            return UserTeamSerializer
        return TeamUserSerializer

    def get_queryset(self):
        queryset = super(TeamUserViewSet, self).get_queryset()
        if 'team' in self.request.query_params:
            queryset = list(chain(UserTeam.objects.filter(user=self.request.user).using('db1').prefetch_related('user'),
                                  UserTeam.objects.filter(user=self.request.user).using('db2').prefetch_related('user')))
            queryset = queryset
        else:
            if hash(self.request.user.username) % 2 == 0:
                queryset = queryset.using('db1')
            else:
                queryset = queryset.using('db2')
            queryset = queryset.filter(user=self.request.user).prefetch_related('team')
        return queryset

router.register('teams', TeamViewSet)
router.register('teamuser', TeamUserViewSet)