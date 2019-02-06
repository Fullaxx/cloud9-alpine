# ------------------------------------------------------------------------------
# Thanks to https://github.com/tghastings/cloud9-docker
# ------------------------------------------------------------------------------
# Pull base image.
FROM alpine:3.8
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Install base
RUN apk --update add build-base bash g++ make git curl python2 supervisor nodejs nodejs-npm tmux
RUN rm -f /var/cache/apk/*

# ------------------------------------------------------------------------------
# Install Cloud9
RUN git clone https://github.com/c9/core.git /c9
WORKDIR /c9
RUN curl https://raw.githubusercontent.com/c9/install/master/link.sh -o scripts/link.sh
RUN chmod +x scripts/link.sh
RUN scripts/link.sh
RUN scripts/install-sdk.sh

# ------------------------------------------------------------------------------
# Add supervisord conf
ADD supervisord.conf /etc/

# ------------------------------------------------------------------------------
# Add volumes
RUN mkdir /c9ws
VOLUME /c9ws

# ------------------------------------------------------------------------------
# Expose ports.
EXPOSE 80

# ------------------------------------------------------------------------------
# Start supervisor, define default command.
ENTRYPOINT ["supervisord", "-c", "/etc/supervisord.conf"]
