# Generated by Django 2.0.1 on 2018-01-25 18:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('team', '0006_auto_20180125_1806'),
    ]

    operations = [
        migrations.AddField(
            model_name='userteam',
            name='name',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
    ]
