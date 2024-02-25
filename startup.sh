# startup.sh is used by infra/resources.bicep to automate database migrations and isn't used by the sample application

# Upgrade the database schema using Flask-Migrate
flask db upgrade

# Start the Gunicorn server with specified configurations
gunicorn --workers 2 --threads 4 --timeout 60 --access-logfile \
    '-' --error-logfile '-' --bind=0.0.0.0:8000 \
     --chdir=/home/site/wwwroot app:app
