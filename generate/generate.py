import datetime
import random

from django.contrib.auth.models import User

from game.models import Game, GameTeam
from match.models import Match
from team.models import Team, UserTeam
from turn.models import Turn


class BaseGenerator:
    def __init__(self, count, using):
        self.count = count
        self.using = using


class AdminGenerator(BaseGenerator):
    def start(self):
        u = User.objects.using(self.using).get(username='admin')
        for i in range(self.count):
            t = Team.objects.using(self.using).get(name='team{}'.format(i))
            tu = UserTeam(
                user=u,
                team=t,
            )
            tu.save(using=self.using)


def get_pk():
    time = datetime.datetime.now()
    time = int(time.strftime("%Y%m%d%H%M%S"))
    return time


class RandomGenerator:
    def __init__(self, count):
        self.count = count

    def start(self):
        c = int(self.count / 10)

        for i in range(c):
            t = Team(
                name='team{}'.format(i),
                games=self.count,
            )
            t.save(using='db1')
            t.save(using='db2')
            for j in range(10):
                u = User(
                    username='user{}'.format(j + 10 * i),
                    email='ivan@ivan{}.ru'.format(j + 10 * i)
                )
                u.set_password('ivan123')
                u.first_name = 'ivan{}'.format(j + 10 * i)
                u.last_name = 'ivanon{}'.format(j + 10 * i)
                ran_db = random.randint(1, 2)
                u.id = get_pk() + ran_db + random.randint(0, 10)
                u.save(using='db' + ran_db)
                tu = UserTeam(
                    user=u,
                    team=t,
                )
                tu.save(using=ran_db)
        cc = int(self.count / 100)

        for i in range(cc):
            t = Turn(
                name='turn{}'.format(i)
            )
            t.save(using='db1')
            t.save(using='db2')
            for j in range(10):
                m = Match(
                    name='match{}'.format(j + 10 * i),
                    turn_id=t.id
                )
                m.save(using='db1')
                m.save(using='db2')
                for l in range(10):
                    g = Game(
                        name='game{}'.format(l + 10 * j + 100 * i),
                        match_id=m.id
                    )
                    ran_db = random.randint(1, 2)
                    g.id = get_pk() + ran_db + random.randint(0, 10)
                    g.save(using='db' + ran_db)
                    tm = Team.objects.using('db' + ran_db).get(name='team{}'.format(j + 10 * i))
                    gt = GameTeam(
                        game=g,
                        team=tm
                    )
                    gt.save(using=ran_db)


class TeamGenerator(BaseGenerator):
    def start(self):
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
                    g.save(using=self.using)
                    tm = Team.objects.using(self.using).get(name='team{}'.format(j + 10 * i))
                    gt = GameTeam(
                        game=g,
                        team=tm
                    )
                    gt.save(using=self.using)

    def clean(self):
        cc = int(self.count / 100)
        for i in range(cc):
            t = Turn.objects.using(self.using).get(name='turn{}'.format(i))
            t.delete()


class Generator(BaseGenerator):
    def start(self):
        c = int(self.count / 10)

        for i in range(c):
            t = Team(
                name='team{}'.format(i),
                games=self.count,
            )
            t.save(using=self.using)
            for j in range(10):
                u = User(
                    username='user{}'.format(j + 10 * i),
                    email='ivan@ivan{}.ru'.format(j + 10 * i)
                )
                u.set_password('ivan123')
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
                    g.save(using=self.using)
                    tm = Team.objects.using(self.using).get(name='team{}'.format(j + 10 * i))
                    print(g.name, t.name)
                    gt = GameTeam(
                        game=g,
                        team=tm
                    )
                    gt.save(using=self.using)

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
