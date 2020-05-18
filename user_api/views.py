from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.request import Request
from rest_framework.response import Response

from library import logger
from user_api import serializers
from user_api import models

LOGGER = logger.get_logger(__name__)


@api_view(('GET', 'POST',))
@permission_classes(())
def user(request: Request):
    if request.method == 'POST':
        user_data: dict = request.data
        user_serializer = serializers.UserSerializer(data=user_data)
        if user_serializer.is_valid():
            user_serializer.save()
            return Response(data=user_serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(data=user_serializer.errors, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    elif request.method == 'GET':
        users = models.User.objects.all()
        users_serializer = serializers.UserSerializer(users, many=True)
        return Response(data=users_serializer.data, status=status.HTTP_200_OK)


@api_view(('GET', 'POST',))
@permission_classes(())
def get_current_user(request: Request):
    try:
        me: models.User = request.user
        if me.is_anonymous:
            return Response(status=status.HTTP_404_NOT_FOUND)
        user_serializer = serializers.UserSerializer(me)
        return Response(data=user_serializer.data, status=status.HTTP_200_OK)
    except AttributeError:
        LOGGER.exception('Error')
        return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(('GET',))
@permission_classes(())
def get_particular_user(request: Request, user_id):
    requested_user = models.User.objects.get(id=user_id)
    user_serializer = serializers.UserSerializer(requested_user)
    return Response(data=user_serializer.data, status=status.HTTP_200_OK)
