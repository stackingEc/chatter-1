import os
import shutil
from django.conf import settings
from django.utils import timezone


def upload_product_image(data):
    check = str(timezone.datetime.now)
    rename = check+'_'+str(data)
    if not os.path.exists(settings.MEDIA_ROOT):
        os.mkdir(settings.MEDIA_ROOT)
    try:
        with open(settings.MEDIA_ROOT + str(rename), 'wb+') as destination:
            for chunk in data.chunks():
                destination.write(chunk)
    except Exception as e:
        print(e)


def move_image_folder(data):
    current_path = settings.MEDIA_ROOT+"/"+data
    new_path = settings.UPLOAD_DIRS
    shutil.move(current_path, new_path)