from __future__ import absolute_import
from django.shortcuts import render
from rest_framework import viewsets

from app.api import router
from .models import Turn
from .serfializers import  TurnSerializer


class TurnViewSet(viewsets.ModelViewSet):
    queryset = Turn.objects.all().order_by('-id').using('db2')
    serializer_class = TurnSerializer

router.register('turns', TurnViewSet)