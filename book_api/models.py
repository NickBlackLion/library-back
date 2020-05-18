from django.db import models
from django.contrib.postgres.fields import ArrayField


class Book(models.Model):
    title = models.TextField(default=None, null=True, blank=True)
    author = ArrayField(base_field=models.TextField(default=None, null=True, blank=True))
    description = models.TextField(default=None, null=True, blank=True)
    short_description = models.TextField(default=None, null=True, blank=True)
    image = models.ImageField(default=None, null=True, blank=True, upload_to='uploads/')
    creation_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'book'
