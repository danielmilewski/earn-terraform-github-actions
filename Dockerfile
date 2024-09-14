# Use the ARM64 base image for Ubuntu

FROM arm64v8/ubuntu:latest

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    bash \
    && apt-get clean


# Install kubectl (ARM64 version)

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Install doctl (ARM64 version)
RUN curl -LO https://github.com/digitalocean/doctl/releases/download/v1.114.0/doctl-1.114.0-linux-arm64.tar.gz && \
    tar -xzf doctl-1.114.0-linux-arm64.tar.gz && \
    chmod +x doctl && \
    mv doctl /usr/local/bin/

# Verify installations
RUN kubectl version --client && \
    doctl version && \
    ls -l /usr/local/bin/doctl

# Set the entrypoint to bash
ENTRYPOINT ["/bin/bash"]

