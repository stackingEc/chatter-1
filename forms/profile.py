# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class FormLogin(forms.Form):
    email = forms.EmailField(label='Correo electronico', widget=forms.TextInput(
        attrs={
            'class': 'form-control',
            'placeholder': 'Email *',
            'required': True,
            'max_length': 25
        }))
    password = forms.CharField(label='Contraseña', widget=forms.PasswordInput(
        attrs={
            'class': 'form-control',
            'placeholder': 'Password *',
            'required': True,
            'max_length': 25
        }))


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ("username", "email", "password1", "password2",)
        labels = {
            "username": "Nombre de Usuario",
            "email": "Correo electronico",
            "password1": "Contraseña",
            "password2": "Confirmación"
        }
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control',
                                               'required': True,
                                               'placeholder': 'User Name *'}),
            'password1': forms.PasswordInput(attrs={'class': 'form-control',
                                                    'required': True,
                                                    'placeholder': 'Password *'}),
            'password2': forms.PasswordInput(attrs={'class': 'form-control',
                                                    'required': True,
                                                    'placeholder': 'Confirm Password *'}),
            'email': forms.TextInput(attrs={'class': 'form-control',
                                            'required': True,
                                            'placeholder': 'info@su-techbian.com'}),
        }


class CreateProfileForm(forms.Form):
    number = forms.CharField(
        label='Número de Teléfono',
        widget=forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Phone number *',
                'required': True,
                'max_length': 11
            }))

    birth_date = forms.DateTimeField(
        label='Fecha de Nacimiento',
        widget=forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'YYYY-MM-DD h-m-s *',
                'help_text': 'YYYY-MM-DD h-m-s',
                'required': True,
                'max_length': 30,
                'id': 'date_of_Birth'
            }))


class FileUploadForm(forms.Form):
    image = forms.FileField()
