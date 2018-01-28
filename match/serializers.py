from rest_framework import serializers
from .models import Match
from turn.serfializers import TurnSerializer


class MatchSerializer(serializers.ModelSerializer):

    turn = TurnSerializer(read_only=True)

    class Meta:
        model = Match
        fields = ('name', 'id', 'turn', 'games', 'avatar', 'date')
