from django.urls import include, path
from rest_framework.routers import DefaultRouter

from .views import AccountTypeViewSet, AccountViewSet

# Create a router and register our viewsets with it
router = DefaultRouter()
router.register(r'accounts', AccountViewSet)
router.register(r'account-types', AccountTypeViewSet)

# The API URLs are determined automatically by the router
urlpatterns = [
    path('', include(router.urls)),
]