from __future__ import absolute_import

import random

from django.shortcuts import render
from rest_framework import viewsets

from app.api import router
from app.views import test_connection_to_db
from .models import Turn
from .serfializers import  TurnSerializer


class TurnViewSet(viewsets.ModelViewSet):
    queryset = Turn.objects.all().order_by('-id')
    serializer_class = TurnSerializer

    def get_queryset(self):
        queryset = super(TurnViewSet, self).get_queryset()
        ran_db = random.randint(1, 2)
        if test_connection_to_db('db1'):
            if test_connection_to_db('db2'):
                queryset = queryset.using('db' + str(ran_db))
            else:
                queryset = queryset.using('db1')
        else:
            queryset = queryset.using('db2')
        return queryset

router.register('turns', TurnViewSet)