from django.db.models.signals import pre_save, pre_delete, post_init, post_save
from .models import Team, UserTeam

def duplicate_name(instance, created=None, *args, **kwargs):
    if created:
        u = UserTeam.objects.filter()