from django.shortcuts import get_object_or_404
from rest_framework import viewsets
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from django.conf import settings
import socket


def test_connection_to_db(database_name):
    try:
        db_definition = getattr(settings, 'DATABASES')[database_name]
        s = socket.create_connection(
            (db_definition['HOST'], db_definition['PORT']), 5)
        s.close()
        return True
    except:
        return False