#
# Docker daemon (docker-in-docker)
#
# http://github.com/tenstartups/docker-daemon
#

FROM tenstartups/alpine:latest

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment variables.
ENV \
  DOCKER_SOCKET=/var/run/docker.sock \
  TERM=xterm-color

# Install packages.
RUN \
  echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
  apk --update add docker && \
  rm -rf /var/cache/apk/*

# Add files to the container.
COPY wrap-docker.sh /usr/local/bin/wrap-docker
COPY entrypoint.sh /docker-entrypoint

# Define volumes.
VOLUME ["/var/lib/docker"]

# Set the entrypoint
ENTRYPOINT ["/docker-entrypoint"]

# Set the default command.
CMD ["/usr/local/bin/wrap-docker"]
