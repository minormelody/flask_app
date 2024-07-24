# Use the official Python image
FROM python:3.9-slim

# Install Git
RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /app

# Clone the GitHub repository
RUN git clone https://github.com/minormelody/flask_app.git .

# Print the directory structure for debugging
RUN ls -la

# Print the contents of requirements.txt to verify
RUN cat requirements.txt

# Install dependencies with force reinstall
RUN pip install --no-cache-dir --force-reinstall -r requirements.txt || (cat /root/.pip/pip.log && exit 1)

# Expose port 5000
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "app.py"]
