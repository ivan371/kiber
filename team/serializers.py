from rest_framework import serializers

from core.serializers import UserSerializer
from .models import Team, UserTeam


class TeamSerializer(serializers.ModelSerializer):
    admin = UserSerializer(read_only=True)

    class Meta:
        model = Team
        fields = ('name', 'admin', 'id', 'games', 'avatar')


class TeamUserSerializer(serializers.ModelSerializer):

    class Meta:
        model = UserTeam
        fields = ('id', 'name', 'user', 'team')