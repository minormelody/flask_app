# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install git and other dependencies
RUN apt-get update && apt-get install -y git

# Install Python dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the entry point script into the container
COPY entrypoint.sh /home/ubuntu/ep/entrypoint.sh
RUN chmod +x /home/ubuntu/ep/entrypoint.sh

# Expose the port on which the app will run
EXPOSE 5000

# Set the entry point script
ENTRYPOINT ["/home/ubuntu/ep/entrypoint.sh"]
