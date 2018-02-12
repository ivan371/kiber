from __future__ import absolute_import

import random

from django.shortcuts import render
from rest_framework import viewsets

from app.api import router
from app.views import test_connection_to_db
from .models import Match
from .serializers import MatchSerializer


class MatchViewSet(viewsets.ModelViewSet):
    queryset = Match.objects.all().order_by('-id')
    serializer_class = MatchSerializer

    def get_queryset(self):
        queryset = super(MatchViewSet, self).get_queryset()
        ran_db = random.randint(1, 2)
        if test_connection_to_db('db1'):
            if test_connection_to_db('db2'):
                queryset = queryset.using('db' + str(ran_db))
            else:
                queryset = queryset.using('db1')
        else:
            queryset = queryset.using('db2')
        return queryset

router.register('matches', MatchViewSet)
