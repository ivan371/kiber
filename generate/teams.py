from django.contrib.auth.models import User

from team.models import Team, UserTeam


def generate(using, count):
    for i in range(count):
        t = Team(
            name='team{}'.format(count),
            games=count,
            admin_id=1
        )
        t.save(using=using)
        for j in range(10):
            u = User.objects.get(username='user{}'.format(j + 10 * i))
            tu = UserTeam(
                user=u,
                team=t,
            )
            tu.save(using=using)


def clean(using, count):
    for i in range(count):
        t = Team.objects.using(using).filter(name='team{}'.format(count))[0]
        t.delete()
