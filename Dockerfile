FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# Collect static files
RUN python manage.py collectstatic --noinput

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' django
RUN chown -R django:django /app
USER django

# Run gunicorn
CMD gunicorn --bind 0.0.0.0:8000 amrs.wsgi