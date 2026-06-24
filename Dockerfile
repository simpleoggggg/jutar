# Use Ubuntu 22.04 base
FROM ubuntu:22.04

# Avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    unzip \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone your repository
RUN git clone https://github.com/simpleoggggg/jutar .

# Unzip the contents (adjust filename if necessary)
# This assumes the zip is in the root after cloning
RUN unzip -o jutar.zip || echo "No zip found, skipping unzip"

# Install requirements if they exist
RUN if [ -f requirements.txt ]; then pip3 install -r requirements.txt; fi

# Expose port 5000
EXPOSE 5000

# Start command (adjust if your entry point is different)
CMD ["python3", "app.py"]
