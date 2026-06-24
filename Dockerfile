# Use Ubuntu 22.04 as the base, which is stable for hosting
FROM ubuntu:22.04

# Set non-interactive mode to prevent install hangs
ENV DEBIAN_FRONTEND=noninteractive

# Update and install essential system tools to behave like a VPS
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    unzip \
    curl \
    git \
    wget \
    nano \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory to /app
WORKDIR /app

# Copy repository contents into the container
COPY . .

# 1. Upgrade pip to the latest version to support modern flags
# 2. Unzip the project archive
# 3. Install requirements
RUN python3 -m pip install --upgrade pip && \
    unzip -o m.zip && \
    pip3 install -r requirements.txt

# Create a non-root user for security (best practice for VPS-like hosting)
RUN useradd -m myuser
USER myuser

# Expose the application port
EXPOSE 5000

# Start the application
# Ensure your app.py is compatible with this command
CMD ["python3", "app.py"]
