# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file to the container
COPY flask_app/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY flask_app/app.py .

# Expose port 5000
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "app.py"]

