#!/bin/bash
echo "🚀 Deploying Django app to EC2..."

# --- EC2 connection details ---
EC2_HOST=ubuntu@ec2-3-141-194-75.us-east-2.compute.amazonaws.com
EC2_PATH=/home/ubuntu/Djangoapp

# --- SSH into EC2 and update code ---
ssh -o StrictHostKeyChecking=no $EC2_HOST << 'ENDSSH'
  cd /home/ubuntu/Djangoapp
  echo "Pulling latest code..."
  git pull origin main
  echo "Activating virtual environment..."
  source venv/bin/activate || source ~/Djangoapp/venv/bin/activate
  echo "Installing requirements..."
  pip install -r requirements.txt
  echo "Restarting Gunicorn service..."
  sudo systemctl restart gunicorn || echo "⚠️ Gunicorn restart skipped (if not using systemd)"
ENDSSH

echo "✅ Deployment to EC2 completed."
