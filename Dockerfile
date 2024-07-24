# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install git
RUN apt-get update && apt-get install -y git

# Install dependencies (assuming requirements.txt is in the repo)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Command to clone the repo and run the Flask app
CMD git clone https://github.com/yourusername/your-repo.git /app && cd /app && pip install -r requirements.txt && flask run --host=0.0.0.0
