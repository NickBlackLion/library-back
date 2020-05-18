from django.urls import path

from book_api import views

urlpatterns = [
    path('', views.book),
    path('<int:book_id>/', views.book_particular),
]
