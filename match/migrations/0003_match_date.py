# Generated by Django 2.0.1 on 2018-01-28 20:19

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('match', '0002_auto_20180128_1757'),
    ]

    operations = [
        migrations.AddField(
            model_name='match',
            name='date',
            field=models.DateField(default=datetime.datetime.now),
        ),
    ]