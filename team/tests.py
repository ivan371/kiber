from django.contrib.auth.models import User
from django.test import TestCase
from team.models import Team


class TeamTestCase(TestCase):
    def setUp(self):
        u = User.objects.create(username="admin")
        Team.objects.create(name="team", admin=u)

    def test_avatar(self):
        t = Team.objects.get(name="team")
        self.assertEqual(t.avatar, 'game.png')
        self.assertEqual(t.games, 0)