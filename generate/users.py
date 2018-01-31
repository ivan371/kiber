from django.contrib.auth.models import User


def generate(using, count):
    for i in range(count):
        u = User.objects.create_user(
            'user{}'.format(i),
            'ivan@ivan{}.ru'.format(i),
            'ivan123'
        )
        u.first_name = 'ivan{}'.format(i)
        u.last_name = 'ivanon{}'.format(i)
        u.save(using=using)


def clean(using, count):
    for i in range(count):
        u = User.objects.using(using).get(username='user{}'.format(i))
        u.delete()
