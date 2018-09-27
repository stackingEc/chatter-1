from django.shortcuts import render
from django.http import HttpResponseRedirect
from forms.profile import CreateProfileForm, FormLogin, CreateUserForm, FileUploadForm
from django.contrib.auth.models import User
from django.contrib import auth, messages
from django.contrib.auth.decorators import login_required
from view.profile import template_login, template_admin
from profiles.models import Profile
from services.profile import upload_product_image


def login(request):
    user_form = CreateUserForm()
    profile_form = CreateProfileForm()
    archive = FileUploadForm()
    form = FormLogin()
    if request.method == 'POST':
        form = FormLogin(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            find_user = User.objects.get(email=email)
            password = form.cleaned_data['password']
            user = auth.authenticate(request, username=find_user.username, password=password)
            if user:
                if user.is_active:
                    auth.login(request, user)
                    return template_admin(user)
                else:
                    return template_login(request, form, user_form, profile_form, archive)
            else:
                return template_login(request, form, user_form, profile_form, archive)
    else:

        return template_login(request, form, user_form, profile_form, archive)


def admin_create_user(request):

    if request.method == 'POST':
        userData = CreateUserForm(request.POST)
        profileData = CreateProfileForm(request.POST)
        archive = FileUploadForm(request.POST, request.FILES)
        form = FormLogin(request.POST)
        if userData.is_valid() and profileData.is_valid():
            user = userData.save()
            user.refresh_from_db()
            get_profile = User.objects.get(id=user.id)
            numero = profileData.cleaned_data['number']
            image = request.FILES.get('image')
            cumpleanos = profileData.cleaned_data['birth_date']
            if archive.is_multipart():
                upload_product_image(image)
                Profile.objects.create(
                                        number=str(numero),
                                        date_of_birth=str(cumpleanos),
                                        image='{0}'.format(image),
                                        user=get_profile).save()
            else:
                Profile.objects.create(
                                        number=str(numero),
                                        date_of_birth=str(cumpleanos),
                                        image='default.png',
                                        user=get_profile).save()

            return template_login(request, form, userData, profileData, archive)
        else:

            return template_login(request, form, userData, profileData, archive)
    else:
        userData = CreateUserForm()
        profileData = CreateProfileForm()
        form = FormLogin()
        archive = FileUploadForm()
        return template_login(request, form, userData, profileData, archive)


def find_user_data(request):
    checker = ''
    if request.is_ajax():
        data = request.GET.get('csrfmiddlewaretoken', None)
        validate = Profile.objects.get(user=data)
        if (validate):
            checker = '/static/images/'+validate.image
        else:
            checker = 'this product doesnt exists 1'
    else:
        return HttpResponseRedirect('')
    return checker