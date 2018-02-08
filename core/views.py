from django.contrib.auth.models import User
from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.decorators import list_route
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.response import Response

from app.views import ShardingViewSet
from .serializers import UserSerializer, UserEditSerializer
from app.api import router


class UserViewSet(ShardingViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def get_serializer_class(self):
        if self.request.method == 'POST':
            return UserEditSerializer
        return UserSerializer

    @list_route()
    def current(self, request, *args, **kwargs):
        print(request.user.is_authenticated)
        if not request.user.is_authenticated:
            raise AuthenticationFailed()
        serializer = self.get_serializer_class()(request.user)
        return Response(serializer.data)

router.register('users', UserViewSet)


def index(request):
    return render(request, 'core/index.html')
