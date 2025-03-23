# Use an outdated base image (this is an example of using a vulnerable version)
FROM node:10

# Install packages without updating package lists (leads to using outdated packages)
RUN apt-get install -y wget curl

# Install unnecessary tools (exposing unnecessary attack surface)
RUN apt-get install -y vim

# Running as root without least privilege (leads to privilege escalation risk)
USER root

# Expose sensitive environment variables directly (leaks sensitive data)
ENV SECRET_KEY=mysecretkey123

# Running applications with insecure permissions
COPY app /app
RUN chmod -R 777 /app

# Use of hard-coded credentials or secrets
ENV DB_PASSWORD=somepassword

# Running the application as root (not recommended)
CMD ["node", "/app/index.js"]
