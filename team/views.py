from __future__ import absolute_import
from django.shortcuts import render
from rest_framework import viewsets

from app.api import router
from .models import Team
from .serializers import TeamSerializer


class TeamViewSet(viewsets.ModelViewSet):
    queryset = Team.objects.all().order_by('-id')
    serializer_class = TeamSerializer

    def perform_create(self, serializer):
        serializer.save(admin=self.request.user)


router.register('teams', TeamViewSet)
