# Use the official Python 3.9 slim image as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install necessary system packages and git
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clone the repository from GitHub
RUN git clone https://github.com/minormelody/flask_app.git /app

# Install pip and set up pip to ensure the latest version
RUN python -m pip install --upgrade pip

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r flask_app/requirements.txt || (cat /root/.pip/pip.log && exit 1)

# Set environment variable for Flask
ENV FLASK_APP=flask_app/app.py

# Expose port 5000 for Flask
EXPOSE 5000

# Command to run the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]
