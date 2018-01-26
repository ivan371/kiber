from django.apps import AppConfig
from django.db.models.signals import pre_save, pre_delete, post_init, post_save

class TurnConfig(AppConfig):
    name = 'turn'

    def ready(self):
        from .views import TurnViewSet
