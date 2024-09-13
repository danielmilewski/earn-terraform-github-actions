# Use the latest Alpine Linux as the base image
FROM alpine:latest

# Install necessary dependencies
RUN apk add --no-cache curl ca-certificates bash

# Install kubectl (latest version)
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Install doctl (DigitalOcean CLI) - Updated to latest version
RUN curl -LO https://github.com/digitalocean/doctl/releases/download/v1.114.0/doctl-1.114.0-linux-amd64.tar.gz && \
    tar -xzf doctl-1.114.0-linux-amd64.tar.gz && \
    mv doctl /usr/local/bin/

# Verify installations
RUN kubectl version --client && \
    doctl version

# Set the entrypoint to bash
ENTRYPOINT ["/bin/bash"]

