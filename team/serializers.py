from rest_framework import serializers

from app.serializers import ShardingSerializer
from core.serializers import UserSerializer
from .models import Team, UserTeam


class TeamSerializer(ShardingSerializer):

    class Meta:
        model = Team
        fields = ('name', 'id', 'games', 'avatar')


class TeamSimpleSerializer(serializers.ModelSerializer):

    class Meta:
        model = Team
        fields = ('name', 'id', 'games', 'avatar')


class TeamUserSerializer(serializers.ModelSerializer):

    team = TeamSimpleSerializer(read_only=True)

    class Meta:
        model = UserTeam
        fields = ('id', 'user', 'team')


class UserTeamSerializer(serializers.ModelSerializer):

    user = UserSerializer(read_only=True)

    class Meta:
        model = UserTeam
        fields = ('id', 'user', 'team')


class TeamUserWriteSerializer(ShardingSerializer):

    class Meta:
        model = UserTeam
        fields = ('id', 'user')


class UserTeamWriteSerializer(ShardingSerializer):

    class Meta:
        model = UserTeam
        fields = ('id', 'team')