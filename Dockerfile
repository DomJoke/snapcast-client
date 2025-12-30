# Use the official Debian base image (stable slim)
FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install Snapclient and ALSA dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        snapclient \
        alsa-utils \
        libasound2 && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m snapclient && \
    usermod -aG audio snapclient

# Run as non-root user by default
USER snapclient

# Default entrypoint to snapclient
ENTRYPOINT ["snapclient"]
