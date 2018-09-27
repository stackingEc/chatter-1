import base64
from django.contrib.auth.hashers import PBKDF2PasswordHasher
from django.core.signing import TimestampSigner
import random
import re
import datetime
from django.utils import timezone
codify = TimestampSigner()


def modifier_encoder(data):
    idUser = "Iam the best you could never crack this {0}".format(data)
    identifier = encode_data(idUser)
    mod = remove_haracters(identifier)
    return mod


def encode_data(data):
    id = codify.sign(data)
    enc = base64.b64encode(bytes(id, "utf-8"))
    return enc


def decode_data(data):
    enc = base64.b64decode(data).decode("utf-8")
    id = codify.unsign(enc)
    removeText = id.replace('Iam the best you could never crack this', '')
    return removeText


def key_gen():
    list_item = ''
    letters = random.choice('ABCDEFGHIJKLMNOPQRSTUVWXYZ')
    for letters in range(100):
        list_item = letters

    return list_item


def removeBandQuote(data):
    remove = data[1:]
    removeSpecialUser = re.sub("[']", '', remove)
    return removeSpecialUser


def expireUrl(data):
    now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")
    now_plus_10 = data + datetime.timedelta(minutes=10)
    nowToString = datetime.datetime.strftime(now_plus_10, "%Y-%m-%d %H:%M:%S.%f")
    validate = 'True' if now <= nowToString else 'False'
    return validate


def remove_haracters(data):
    tostring = "{0}".format(data)
    fixed = ''.join(tostring.split("b'", 1))
    otherfixed = ''.join(fixed.split("'", -1))
    return otherfixed


def encode_django(data):
    codec = PBKDF2PasswordHasher()
    hasher = codec.encode(password=data,
                        salt='salt',
                        iterations=50000)
    return hasher


def decode_django(normal_password, coded_password):
    codec = PBKDF2PasswordHasher()
    check = codec.verify(normal_password, coded_password)
    return check



