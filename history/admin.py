from django.contrib import admin
from .models import Groups, ChatHistory, PersonalMessage
# Register your models here.


class HistoryAdmin(admin.ModelAdmin):
    pass


admin.site.register(Groups)
admin.site.register(ChatHistory)
admin.site.register(PersonalMessage)