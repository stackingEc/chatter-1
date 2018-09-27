# Create your views here.
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect


def template_login(request, form, user, profile, file):
    return render(request, 'index.html', {
                                                'form': form,
                                                'user_': user,
                                                'profile_': profile,
                                                'file_': file
                                                })


def redirect_ajax_fail():
    return HttpResponseRedirect('/administration.jsp')


def template_admin(user):
    return HttpResponseRedirect('/chat', {'user': user})


def template_reset_mail(request, form):
    return render(request, 'login/reset.html', {
        'form': form
    })


def template_reset_password(request, data, form):
    return render(request, 'administration/UserPasswordReset.html', {'data': data,
                                                                     'form': form})

