#
# Docker daemon (docker-in-docker)
#
# http://github.com/tenstartups/docker-daemon
#

FROM alpine

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment variables.
ENV \
  TERM=xterm-color

# Install packages.
RUN \
  apk --update add bash coreutils curl docker nano wget && \
  rm -rf /var/cache/apk/*

# Add files to the container.
COPY wrap-docker.sh /usr/local/bin/wrap-docker

# Define volumes.
VOLUME ["/var/lib/docker"]

# Set the default command.
CMD ["/usr/local/bin/wrap-docker"]
