from django.urls import path

from user_api import views

urlpatterns = [
    path('<int:user_id>/', views.get_particular_user),
    path('me/', views.get_current_user),
    path('', views.user)
]
