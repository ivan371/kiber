from django.apps import AppConfig


class GameConfig(AppConfig):
    name = 'game'

    def ready(self):
        from .views import GameViewSet