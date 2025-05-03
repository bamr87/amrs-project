#!/bin/sh
set -e

# Wait for the database to be ready
if [ -n "$DATABASE_URL" ]; then
  echo "Waiting for database..."
  until python manage.py migrate --check; do
    sleep 2
  done
fi

# Run migrations
python manage.py makemigrations --noinput
python manage.py migrate --noinput

# Create superuser if env vars are set and user doesn't exist
if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] && [ -n "$DJANGO_SUPERUSER_EMAIL" ]; then
  echo "Creating superuser..."
  python manage.py shell << END
from django.contrib.auth import get_user_model\nUser = get_user_model()\nif not User.objects.filter(username='$DJANGO_SUPERUSER_USERNAME').exists():\n    User.objects.create_superuser('$DJANGO_SUPERUSER_USERNAME', '$DJANGO_SUPERUSER_EMAIL', '$DJANGO_SUPERUSER_PASSWORD')
END
else
  echo "Superuser credentials not provided, skipping superuser creation."
fi

# Collect static files
python manage.py collectstatic --noinput

# Start gunicorn
exec gunicorn --bind 0.0.0.0:8000 amrs.wsgi
