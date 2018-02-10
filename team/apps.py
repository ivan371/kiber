from __future__ import absolute_import

from django.apps import AppConfig


class TeamConfig(AppConfig):
    name = 'team'

    def ready(self):
        from .views import TeamViewSet
        import team.signals