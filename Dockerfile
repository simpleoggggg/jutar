# Use Ubuntu 22.04 base
FROM ubuntu:22.04

# Avoid interaction prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy all files from your repo to the container
COPY . .

# Unzip the file and install requirements
# The -o flag ensures it overwrites files if necessary
RUN unzip -o m.zip && \
    pip3 install -r requirements.txt --break-system-packages

# Expose port 5000 as requested
EXPOSE 5000

# Set the command to run your app
CMD ["python3", "app.py"]
