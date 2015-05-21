#
# Docker daemon (docker-in-docker)
#
# http://github.com/tenstartups/docker-daemon
#

FROM debian:jessie

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment variables.
ENV \
  DEBIAN_FRONTEND=noninteractive \
  TERM=xterm-color \
  HOME=/home/docker

# Install the rest of the base packages.
RUN apt-get update && apt-get -y install \
  apt-transport-https \
  build-essential \
  ca-certificates \
  curl \
  git \
  iptables \
  nano \
  net-tools \
  wget

# Install Docker
RUN curl -sSL https://get.docker.com/ | sh

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set the working directory.
WORKDIR /home/docker

# Add files to the container.
ADD . /home/docker

# Define volumes.
VOLUME ["/var/lib/docker"]

# Set the default command.
CMD ["./wrapdocker"]
