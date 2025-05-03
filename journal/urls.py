from django.urls import include, path
from rest_framework.routers import DefaultRouter

from .views import JournalEntryViewSet, JournalLineViewSet

# Create a router and register our viewsets with it
router = DefaultRouter()
router.register(r'entries', JournalEntryViewSet)
router.register(r'lines', JournalLineViewSet)

# The API URLs are determined automatically by the router
urlpatterns = [
    path('', include(router.urls)),
]