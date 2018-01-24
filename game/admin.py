from django.contrib import admin
from .models import Game, GameTeam


class GameTeamInline(admin.StackedInline):
    model = GameTeam


@admin.register(Game)
class GameAdmin(admin.ModelAdmin):
    inlines = (GameTeamInline, )
