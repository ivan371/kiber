class PrimaryRouter(object):
    def db_for_read(self, model, **hints):
        print(hints)
        if 'instance' in hints:
            if hints['instance'].id % 2:
                print('db1')
                return 'db1'
        return 'db2'

    def db_for_write(self, model, **hints):
        print(hints)
        if 'instance' in hints:
            if model._meta.app_label == 'auth':
                if hash(hints['instance'].username) % 2:
                    print('db1', 'write')
                    return 'db1'
            else:
                if hints['instance'].id % 2:
                    print('db1', 'write')
                    return 'db1'
        return 'db2'

    def allow_relation(self, obj1, obj2, **hints):
        return True


    def allow_migrate(self, db, app_label, model=None, **hints):
        return True