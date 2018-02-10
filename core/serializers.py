from django.contrib.auth.models import User
from django.http import Http404
from rest_framework import serializers

from core.tasks import send_mail


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'id')


class UserEditSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'first_name', 'last_name', 'password')

        def create(self, validated_data):
            try:
                return User.objects.create_user(
                    validated_data.get('username'),
                    validated_data.get('email'),
                    validated_data.get('password'),
                    first_name=validated_data.get('first_name'),
                    last_name=validated_data.get('last_name'),
                )
            except:
                raise Http404

        def update(self, instance, validated_data):
            try:
                instance.email = validated_data.get('email')
                instance.first_name = validated_data.get('first_name')
                instance.last_name = validated_data.get('last_name')
                instance.save()
                return instance
            except:
                raise Http404
