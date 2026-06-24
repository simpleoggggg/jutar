FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

# Unzip and list files to debug the location
RUN unzip -o m.zip && ls -R /app

# Install requirements
RUN pip3 install -r requirements.txt --break-system-packages

EXPOSE 5000

# Start command
CMD ["python3", "app.py"]
