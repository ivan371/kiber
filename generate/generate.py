from django.contrib.auth.models import User

from game.models import Game, GameTeam
from match.models import Match
from team.models import Team, UserTeam
from turn.models import Turn


class Generator:
    def __init__(self, count, using):
        self.count = count
        self.using = using

    def start(self):
        c = int(self.count / 10)

        for i in range(c):
            t = Team(
                name='team{}'.format(i),
                games=self.count,
                admin_id=1
            )
            t.save(using=self.using)
            for j in range(10):
                u = User.objects.create_user(
                    'user{}'.format(j + 10 * i),
                    'ivan@ivan{}.ru'.format(j + 10 * i),
                    'ivan123'
                )
                u.first_name = 'ivan{}'.format(j + 10 * i)
                u.last_name = 'ivanon{}'.format(j + 10 * i)
                u.save(using=self.using)
                tu = UserTeam(
                    user=u,
                    team=t,
                )
                tu.save(using=self.using)
        cc = int(self.count / 100)

        for i in range(cc):
            t = Turn(
                name='turn{}'.format(i)
            )
            t.save(using=self.using)
            for j in range(10):
                m = Match(
                    name='match{}'.format(j + 10 * i),
                    turn_id=t.id
                )
                m.save(using=self.using)
                for l in range(10):
                    g = Game(
                        name='game{}'.format(l + 10 * j + 100 * i),
                        match_id=m.id
                    )
                    g.save()
                    tm = Team.objects.get(name='team{}'.format(j + 10 * i))
                    print(g.name, t.name)
                    gt = GameTeam(
                        game=g,
                        team=tm
                    )
                    gt.save()

    def clean(self):
        for i in range(self.count):
            u = User.objects.using(self.using).get(username='user{}'.format(i))
            u.delete()
        c = int(self.count / 10)
        for i in range(c):
            t = Team.objects.using(self.using).filter(name='team{}'.format(i))[0]
            t.delete()
        cc = int(self.count / 100)
        for i in range(cc):
            t = Turn.objects.using(self.using).get(name='turn{}'.format(i))
            t.delete()
