from django.urls import path, include

urlpatterns = [
    path('api/', include('library_api.urls'))
]
