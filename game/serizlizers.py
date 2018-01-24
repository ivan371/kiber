from rest_framework import serializers

from team.serializers import TeamSerializer
from .models import Game


class GameSerializer(serializers.ModelSerializer):
    winner = TeamSerializer()

    class Meta:
        model = Game
        fields = ('name', 'winner', 'id')
