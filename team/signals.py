from django.db.models.signals import pre_save, pre_delete, post_init, post_save

from team.tasks import change_name
from .models import Team, UserTeam


def duplicate_name(instance, created=None, *args, **kwargs):
    if not created:
        change_name(instance.name, instance.id)

post_save.connect(duplicate_name, sender=Team)