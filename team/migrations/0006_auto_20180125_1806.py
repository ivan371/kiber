# Generated by Django 2.0.1 on 2018-01-25 18:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('team', '0005_remove_team_games'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userteam',
            name='name',
        ),
        migrations.AddField(
            model_name='team',
            name='games',
            field=models.IntegerField(default=0),
        ),
    ]