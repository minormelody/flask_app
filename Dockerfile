# Use the official Python image
FROM python:3.9-slim

# Install Git
RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /app

# Clone the GitHub repository
RUN git clone https://github.com/minormelody/flask_app.git .

# Print the contents of the working directory to verify
RUN ls -l

# Print the contents of requirements.txt to ensure it is correct
RUN cat requirements.txt

# Install dependencies
RUN pip install --no-cache-dir --force -r requirements.txt || (cat /root/.pip/pip.log && exit 1)

# Expose port 5000
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "app.py"]
