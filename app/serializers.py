import random
import traceback

from rest_framework import serializers
from rest_framework.serializers import raise_errors_on_nested_writes
from rest_framework.utils import model_meta

from generate.generate import get_pk


class ShardingSerializer(serializers.ModelSerializer):
    def create(self, validated_data):
        raise_errors_on_nested_writes('create', self, validated_data)

        ModelClass = self.Meta.model
        # print('meta in create', ModelClass._meta.verbose_name)
        info = model_meta.get_field_info(ModelClass)
        many_to_many = {}
        for field_name, relation_info in info.relations.items():
            if relation_info.to_many and (field_name in validated_data):
                many_to_many[field_name] = validated_data.pop(field_name)
        try:
            if ModelClass._meta.verbose_name == 'game' or ModelClass._meta.verbose_name == 'user':
                ran_db = random.randint(1, 2)
                validated_data['id'] = int(get_pk() + str(ran_db))
                instance = ModelClass(**validated_data)
                instance.save(using='db' + str(ran_db))
            else:
                if 'using' in validated_data:
                    using = validated_data.pop('using')
                    instance = ModelClass(**validated_data)
                    if using == 'all':
                        instance.save(using='db1')
                        instance.save(using='db2')
                        # instance.save()
                    else:
                        instance.save(using=using)
                else:
                    instance = ModelClass.objects.create(**validated_data)
        except TypeError:
            tb = traceback.format_exc()
            msg = (
                'Got a `TypeError` when calling `%s.objects.create()`. '
                'This may be because you have a writable field on the '
                'serializer class that is not a valid argument to '
                '`%s.objects.create()`. You may need to make the field '
                'read-only, or override the %s.create() method to handle '
                'this correctly.\nOriginal exception was:\n %s' %
                (
                    ModelClass.__name__,
                    ModelClass.__name__,
                    self.__class__.__name__,
                    tb
                )
            )
            raise TypeError(msg)

        # Save many-to-many relationships after the instance is created.
        if many_to_many:
            for field_name, value in many_to_many.items():
                field = getattr(instance, field_name)
                field.set(value)

        return instance