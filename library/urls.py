from django.urls import path, include

urlpatterns = [
    path('api/book/', include('book_api.urls')),
    path('api/user/', include('user_api.urls')),
    path('api/token/', include('token_api.urls')),
]
