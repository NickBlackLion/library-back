from library import logger

from django.db.models import ObjectDoesNotExist
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.request import Request

from library_api import models
from library_api import serializers

logger = logger.get_logger(__name__)


@api_view(('GET',))
@permission_classes(())
def book(request: Request):
    books = models.Book.objects.all().order_by('creation_date')
    book_serializer = serializers.BookSerializer(books, many=True)
    return Response(data=book_serializer.data, status=status.HTTP_200_OK)


@api_view(('GET',))
@permission_classes(())
def book_particular(request: Request, book_id: int):
    try:
        book = models.Book.objects.get(id=book_id)
        book_serializer = serializers.BookSerializer(book)
        return Response(data=book_serializer.data, status=status.HTTP_200_OK)
    except ObjectDoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
