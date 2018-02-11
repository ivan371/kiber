from rest_framework import serializers

from app.serializers import ShardingSerializer
from team.serializers import TeamSerializer, TeamSimpleSerializer
from .models import Game, GameTeam


class GameSerializer(serializers.ModelSerializer):
    winner = TeamSerializer()

    class Meta:
        model = Game
        fields = ('name', 'winner', 'id', 'date')


class GameSimpleSerializer(ShardingSerializer):
    class Meta:
        model = Game
        fields = ('name', 'id', 'date')


class GameTeamSerializer(ShardingSerializer):

    game = GameSimpleSerializer(read_only=True)

    class Meta:
        model = GameTeam
        fields = ('id', 'game', 'team')


class TeamGameSerializer(ShardingSerializer):

    team = TeamSimpleSerializer(read_only=True)

    class Meta:
        model = GameTeam
        fields = ('id', 'game', 'team')


class GameTeamWriteSerializer(ShardingSerializer):

    class Meta:
        model = GameTeam
        fields = ('id', 'team')


class TeamGameWriteSerializer(ShardingSerializer):

    class Meta:
        model = GameTeam
        fields = ('id', 'game')