from library import logger

from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.request import Request

from library_api import serializers

logger = logger.get_logger(__name__)


@api_view(('GET',))
@permission_classes(())
def get_user(request: Request):
    user = request.user
    user_serializer = serializers.UserSerializer(user)
    return Response(data=user_serializer.data, status=status.HTTP_200_OK)
