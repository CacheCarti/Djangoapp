#!/bin/bash
set -e

echo "Deploying Django project to EC2..."

ssh -o StrictHostKeyChecking=no ubuntu@3.141.194.75 << 'EOF'
  cd ~/Djangoapp || exit
  echo "Pulling latest changes..."
  git pull origin main
  source venv/bin/activate || source env/bin/activate || true
  pip install -r requirements.txt
  echo "Running migrations..."
  python manage.py migrate --noinput
  echo "Collecting static files..."
  python manage.py collectstatic --noinput
  echo "Restarting Django dev server (runserver)..."
  # Kill old runserver (if running)
  pkill -f "manage.py runserver" || true
  nohup python manage.py runserver 0.0.0.0:8000 &
  echo "Deployment complete."
EOF
