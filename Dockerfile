# Use an official Python runtime
FROM python:3.11-slim

# Install system dependencies (including unzip)
RUN apt-get update && apt-get install -y unzip

# Set the working directory
WORKDIR /app

# Copy your zip file and requirements file
COPY m.zip .

# Unzip the file and install requirements
# Assuming requirements.txt is extracted from m.zip
RUN unzip -o m.zip && pip install -r requirements.txt

# Copy the rest of your application code if needed
COPY . .

# Set the command to run your app
CMD ["python", "app.py"]
