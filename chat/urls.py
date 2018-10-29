"""chat URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))

urlpatterns += staticfiles_urlpatterns()

"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url
from django.conf.urls.static import static
from history import views as history
from profiles import views as profile
from django.contrib.staticfiles.urls import staticfiles_urlpatterns


urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^$', profile.login, name='login'),
    url(r'^login.jsp/$', profile.login, name='login'),
    url(r'^create_user.jsp/$', profile.admin_create_user, name='create_user'),
    url(r'^chat/$', history.chat_history, name='chat_history'),
    url(r'^get_image/$', history.user_image, name='get_image'),
    url(r'^message/$', history.save_message, name='chat_save_message'),
    url(r'^chat_history/$', history.history_by_type, name='chat_history'),
    url(r'^rabbit/$', history.queue_message, name='rabbit'),
]



urlpatterns += staticfiles_urlpatterns()


