# coding: utf-8
from celery import task
from team.models import Team, UserTeam


@task(bind=True)
def change_name(self, name, id, time=60):

    try:
        pass
        # UserTeam.objects.using('db1').filter(team_id=id).update(name=name)
        # UserTeam.objects.using('db2').filter(team_id=id).update(name=name)
    except Exception as exc:

        time *= 2

        raise self.retry(exc=exc, countdown=time)