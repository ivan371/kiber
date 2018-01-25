from django.apps import AppConfig


class TurnConfig(AppConfig):
    name = 'turn'

    def ready(self):
        from .views import TurnViewSet
