#!/usr/bin/env bash

# Kill any Django servers running in the background
sudo pkill -f runserver

# If deploying frontend, uncomment to kill Tailwind or Node.js servers
# sudo pkill -f tailwind
# sudo pkill -f node

# Navigate to the Django project directory
cd /home/ubuntu/django-aws_cicd/

# Activate the virtual environment
python3 -m venv venv
source venv/bin/activate

# Install requirements
pip install -r /home/ubuntu/django-aws_cicd/requirements.txt

# Run the server in a detached screen session
screen -dmS django_server python3 manage.py runserver 0.0.0.0:8000
