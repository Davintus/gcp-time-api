# Use the official lightweight Python image.  
FROM python:3.12-slim  

# Copy local code to the container image.  
ENV APP_HOME /app  
WORKDIR $APP_HOME  
COPY . ./  

# Install production dependencies.  
RUN pip install Flask gunicorn  

# Run the web service on container startup.  
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app