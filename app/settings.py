"""
Django settings for app project.

Generated by 'django-admin startproject' using Django 2.0.1.

For more information on this file, see
https://docs.djangoproject.com/en/2.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.0/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '(st*$6xpkl3@v^35d%mva#hf5gb5)ynnmrv=57=b&l0ls#)ucf'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'core.apps.CoreConfig',
    'team.apps.TeamConfig',
    'game.apps.GameConfig',
    'turn.apps.TurnConfig',
    'match.apps.MatchConfig',
    'debug_toolbar',
    'oauth2_provider',
    # "django_sharding",
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
]

ROOT_URLCONF = 'app.urls'

# AUTH_USER_MODEL = 'core.User'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'app.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.0/ref/settings/#databases

DATABASES = {
    # 'default': {},
    'default': {
        'NAME': 'test0',
        'ENGINE': 'django.db.backends.mysql',
        'USER': 'test',
        'PASSWORD': 'pass',
        'HOST': 'localhost',
        'PORT': '3306',
    },
    'db1': {
        'NAME': 'test1',
        'ENGINE': 'django.db.backends.mysql',
        'USER': 'test',
        'PASSWORD': 'pass',
        'HOST': 'localhost',
        'PORT': '3306',
    },
    'db2': {
        'NAME': 'test2',
        'ENGINE': 'django.db.backends.mysql',
        'USER': 'test',
        'PASSWORD': 'pass',
        'HOST': 'localhost',
        'PORT': '3306',
    },
    'sl1': {
        'NAME': 'slave1',
        'ENGINE': 'django.db.backends.mysql',
        'USER': 'test',
        'PASSWORD': 'pass',
        'HOST': 'localhost',
        'PORT': '3306',
    },
    'sl2': {
        'NAME': 'slave2',
        'ENGINE': 'django.db.backends.mysql',
        'USER': 'test',
        'PASSWORD': 'pass',
        'HOST': 'localhost',
        'PORT': '3306',
    },
}

DATABASE_ROUTERS = ['app.db_route.PrimaryRouter',]


# Password validation
# https://docs.djangoproject.com/en/2.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/2.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.0/howto/static-files/

STATIC_URL = '/static/'
MEDIA_URL = '/media/'
STATIC_ROOT = os.path.join(os.path.dirname(BASE_DIR), 'static/')
STATICFILES_DIRS = ['/mnt/c/Users/nagai/intensiv/back/app/static/', ]
MEDIA_ROOT = os.path.join(os.path.dirname(BASE_DIR), 'media/')

REST_FRAMEWORK = {
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.LimitOffsetPagination',
    'PAGE_SIZE': 10,
    'TEST_REQUEST_DEFAULT_FORMAT': 'json',
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'oauth2_provider.contrib.rest_framework.OAuth2Authentication',
    )

}

OAUTH2_PROVIDER = {
    'SCOPES': {'read': 'Read scope', 'write': 'Write scope', 'groups': 'Access to your groups'}
}


INTERNAL_IPS = '127.0.0.1'