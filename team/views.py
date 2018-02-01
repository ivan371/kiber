from __future__ import absolute_import
from django.shortcuts import render, get_object_or_404
from rest_framework import viewsets
from rest_framework.response import Response

from app.api import router
from app.views import test_connection_to_db
from .models import Team, UserTeam
from .serializers import TeamSerializer, TeamUserSerializer, UserTeamSerializer, TeamUserWriteSerializer, \
    UserTeamWriteSerializer
from itertools import chain


class TeamViewSet(viewsets.ModelViewSet):
    queryset = Team.objects.all().order_by('-id')
    serializer_class = TeamSerializer

    def perform_create(self, serializer):
        serializer.save()

    def get_queryset(self):
        queryset = super(TeamViewSet, self).get_queryset()
        if test_connection_to_db('db2'):
            if self.request.user.id % 2 != 0 or test_connection_to_db('db1'):
                queryset = queryset.using('db2')
            else:
                queryset = queryset.using('db1')
        else:
            queryset = queryset.using('db1')
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
            if hash(self.request.user.id) % 2 == 0:
                serializer.save(user=self.request.user, using='db1')
            else:
                serializer.save(user=self.request.user, using='db2')

    def get_object(self):
        # if 'team' in self.request.query_params:
        #     if self.request.query_params['team'].isdigit:
        #         queryset = UserTeam.objects.all().using('db2')
        # else:
        queryset = self.filter_queryset(self.get_queryset())

        lookup_url_kwarg = self.lookup_url_kwarg or self.lookup_field
        assert lookup_url_kwarg in self.kwargs, (
            'Expected view %s to be called with a URL keyword argument '
            'named "%s". Fix your URL conf, or set the `.lookup_field` '
            'attribute on the view correctly.' %
            (self.__class__.__name__, lookup_url_kwarg)
        )
        filter_kwargs = {self.lookup_field: self.kwargs[lookup_url_kwarg]}
        obj = get_object_or_404(queryset, **filter_kwargs)
        self.check_object_permissions(self.request, obj)
        # ob = UserTeam.objects.filter(id=self.kwargs['pk'])
        # print(ob)
        # if obj:
        #     return get_object_or_404(UserTeam, id=0)
        return obj

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