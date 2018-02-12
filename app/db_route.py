from app.views import test_connection_to_db


class PrimaryRouter(object):
    def db_for_read(self, model, **hints):
        print(hints, model._meta.verbose_name)
        # if 'instance' in hints:
        #     if model._meta.app_label == 'game' or model._meta.app_label == 'team':
        #         if hash(hints['instance'].name) % 2:
        #             print('db1', 'write')
        #             return 'db1'
        #     else:
        #         if hints['instance'].id % 2:
        #             print('db1')
        #             return 'db1'
        # return 'db2'
        if model._meta.verbose_name == 'access token':
            if not test_connection_to_db('db1'):
                return 'sl1'
        return None

    def db_for_write(self, model, **hints):
        print(hints, model._meta.verbose_name)
        # if 'instance' in hints:
        #     if model._meta.app_label == 'auth':
        #         if hash(hints['instance'].username) % 2:
        #             return 'db1'
        #     elif model._meta.app_label == 'game' or model._meta.app_label == 'team':
        #         if hash(hints['instance'].name) % 2:
        #             return 'db1'
        #     else:
        #         if hints['instance'].id % 2:
        #             print('db1', 'write')
        #             return 'db1'
        # return 'db2'
        return None

    def allow_relation(self, obj1, obj2, **hints):
        return True

    def allow_migrate(self, db, app_label, model=None, **hints):
        return True