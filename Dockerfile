FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

# 1. Upgrade pip
# 2. Unzip the file
# 3. FIX PERMISSIONS: Ensure the current user can execute files and write to directories
RUN python3 -m pip install --upgrade pip && \
    unzip -o m.zip && \
    chmod -R 755 /app && \
    pip3 install -r requirements.txt

EXPOSE 5000

CMD ["python3", "app.py"]
