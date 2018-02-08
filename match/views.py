from __future__ import absolute_import
from django.shortcuts import render
from rest_framework import viewsets

from app.api import router
from .models import Match
from .serializers import MatchSerializer


class MatchViewSet(viewsets.ModelViewSet):
    queryset = Match.objects.all().order_by('-id')
    serializer_class = MatchSerializer

    def get_queryset(self):
        queryset = super(MatchViewSet, self).get_queryset()
        return queryset.using('db1')

router.register('matches', MatchViewSet)
