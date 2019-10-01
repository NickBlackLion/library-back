from django.urls import path
from library_api import book_views
from library_api import user_views
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

urlpatterns = [
    path('token/', TokenObtainPairView.as_view()),
    path('token/refresh/', TokenRefreshView.as_view()),
    path('user/', user_views.get_user),
    path('book/', book_views.book),
    path('book/<int:book_id>/', book_views.book_particular),
]
