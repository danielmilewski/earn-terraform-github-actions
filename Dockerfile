# Use the latest Ubuntu as the base image
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    bash \
    file \ 
    && apt-get clean

# Install kubectl (latest version)
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Install doctl (DigitalOcean CLI) - Updated to latest version
RUN curl -LO https://github.com/digitalocean/doctl/releases/download/v1.114.0/doctl-1.114.0-linux-amd64.tar.gz && \
    tar -xzf doctl-1.114.0-linux-amd64.tar.gz && \
    chmod +x doctl && \
    mv doctl /usr/local/bin/

# Verify installations
RUN kubectl version --client && \
    doctl version && \
    ls -l /usr/local/bin/doctl && \
    file /usr/local/bin/kubectl && \
    file /usr/local/bin/doctl

# Set the entrypoint to bash
ENTRYPOINT ["/bin/bash"]

