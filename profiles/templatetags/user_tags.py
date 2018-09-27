from django import template
from profiles.models import *
from django.utils.safestring import mark_safe

register = template.Library()


@register.simple_tag
def user_image(data):
    id = str(data)
    usr = Profile.objects.get(user=id)
    result = '/static/images/'+usr.image
    return mark_safe(result)

