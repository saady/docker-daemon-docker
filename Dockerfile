#
# Docker daemon (docker-in-docker)
#
# http://github.com/tenstartups/docker-daemon
#

FROM tenstartups/alpine:latest

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment variables.
ENV \
  TERM=xterm-color

# Install packages.
RUN \
  echo 'http://dl-4.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
  apk --update add docker && \
  rm -rf /var/cache/apk/*

# Add files to the container.
COPY wrap-docker.sh /usr/local/bin/wrap-docker

# Define volumes.
VOLUME ["/var/lib/docker"]

# Set the default command.
CMD ["/usr/local/bin/wrap-docker"]
