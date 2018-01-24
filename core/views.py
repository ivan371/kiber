from django.contrib.auth.models import User
from django.shortcuts import render
from rest_framework import viewsets

from .serializers import UserSerializer
from app.api import router


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer


router.register('users', UserViewSet)


def index(request):
    return render(request, 'core/index.html')
