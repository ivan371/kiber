# Generated by Django 2.0.1 on 2018-01-28 20:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('match', '0003_match_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='match',
            name='avatar',
            field=models.ImageField(default='match.png', upload_to='avatars'),
        ),
    ]
