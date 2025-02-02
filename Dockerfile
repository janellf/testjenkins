# Use Jenkins agent base image
From jenkins/inbound-agent:latest

# Install necessary dependencies (e.g., Bash, Git)
USER root 

RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Switch back to Jenkins user
USER jenkins  
