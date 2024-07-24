# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install git and other dependencies
RUN apt-get update && apt-get install -y git

# Clone the repository
RUN git clone https://github.com/minormelody/flask_app.git .

# Output the directory listing for debugging
RUN ls -al /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt || (cat /root/.pip/pip.log && exit 1)

# Expose port 5000
EXPOSE 5000

# Command to run the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]
