from itertools import chain

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


class ShardingViewSet(viewsets.ModelViewSet):
    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        if test_connection_to_db('db2'):
            if test_connection_to_db('db1'):
                if int(self.kwargs['pk']) % 2 == 0:
                    queryset = queryset.using('db2')
                else:
                    queryset = queryset.using('db1')
            else:
                queryset = queryset.using('db2')
        else:
            queryset = queryset.using('db1')
        lookup_url_kwarg = self.lookup_url_kwarg or self.lookup_field
        assert lookup_url_kwarg in self.kwargs, (
            'Expected view %s to be called with a URL keyword argument '
            'named "%s". Fix your URL conf, or set the `.lookup_field` '
            'attribute on the view correctly.' %
            (self.__class__.__name__, lookup_url_kwarg)
        )
        filter_kwargs = {self.lookup_field: self.kwargs[lookup_url_kwarg]}
        obj = get_object_or_404(queryset, **filter_kwargs)
        self.check_object_permissions(self.request, obj)
        return obj

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        if test_connection_to_db('db2'):
            if test_connection_to_db('db2'):
                print(queryset.model._meta.verbose_name)
                if queryset.model._meta.verbose_name == 'game' or queryset.model._meta.verbose_name == 'user':
                    queryset = list(set(chain(queryset.using('db1'), queryset.using('db2'))))
            else:
                queryset = queryset.using('db1')
        else:
            queryset = queryset.using('db1')

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
