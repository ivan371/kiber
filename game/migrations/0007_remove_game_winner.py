# Generated by Django 2.0.1 on 2018-01-31 09:54

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('game', '0006_auto_20180131_0910'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='game',
            name='winner',
        ),
    ]
