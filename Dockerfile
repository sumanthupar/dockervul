# Use an outdated or unmaintained base image (e.g., Ubuntu 16.04, not updated anymore)
FROM ubuntu:16.04

# Install unnecessary packages and utilities (exposes unnecessary attack surface)
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    git \
    build-essential \
    && apt-get clean

# Install packages without updating or verifying sources (outdated or vulnerable packages)
RUN apt-get update && apt-get install -y \
    openssl \
    net-tools \
    && apt-get clean

# Expose unnecessary ports (for testing purposes, assume no need for these)
EXPOSE 8080 5000

# Allow root user (insecure, containers should avoid running as root)
USER root

# Set insecure environment variables, such as hardcoded secrets
ENV DB_PASSWORD=mySuperSecretPassword123
ENV API_KEY=1234567890abcdef

# Grant overly permissive permissions to files
RUN chmod -R 777 /usr/local

# Use insecure default command (running as root with unnecessary commands)
CMD ["bash"]
