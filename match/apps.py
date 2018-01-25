from django.apps import AppConfig


class MatchConfig(AppConfig):
    name = 'match'

    def ready(self):
        from .views import MatchViewSet
