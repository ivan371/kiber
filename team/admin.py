from django.contrib import admin
from .models import Team, UserTeam


class UserTeamInline(admin.StackedInline):
    model = UserTeam


@admin.register(Team)
class TeamAdmin(admin.ModelAdmin):
    inlines = (UserTeamInline, )
