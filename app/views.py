from django.shortcuts import get_object_or_404
from rest_framework import viewsets
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response


class ShardingViewSet(viewsets.ModelViewSet):

    def paginate_queryset(self, queryset):
        if self.paginator is None:
            return None
        try:
            return self.paginator.paginate_queryset(queryset, self.request, view=self)
        except:
            try:
                return self.paginator.paginate_queryset(queryset.using('db1'), self.request, view=self)
            except:
                return self.paginator.paginate_queryset(queryset.using('db2'), self.request, view=self)

    def retrieve(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
            print('except1')
        except:
            try:
                instance = self.get_object().using('db1')
                print('except2')
            except:
                instance = self.get_object().using('db2')
                print('except3')
        serializer = self.get_serializer(instance)
        return Response(serializer.data)