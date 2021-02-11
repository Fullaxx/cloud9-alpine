# ------------------------------------------------------------------------------
# Thanks to https://github.com/tghastings/cloud9-docker
# ------------------------------------------------------------------------------
# Pull base image
FROM alpine:3.8
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Install base and clean up
RUN apk --update add build-base bash \
	  curl g++ git make nodejs nodejs-npm python2 tmux && \
	rm -f /var/cache/apk/*

# ------------------------------------------------------------------------------
# Install Cloud9 and clean up
RUN git clone https://github.com/c9/core.git /c9 && cd /c9 && \
	curl -s https://raw.githubusercontent.com/c9/install/master/link.sh \
	  -o scripts/link.sh && chmod +x scripts/link.sh && \
	./scripts/link.sh && \
	./scripts/install-sdk.sh && \
	rm -rf /c9/.git /root/.c9/tmp /root/.npm /root/.node-gyp

# ------------------------------------------------------------------------------
# Add app.sh
COPY app.sh /app/

# ------------------------------------------------------------------------------
# Add volumes
VOLUME /log
VOLUME /c9ws

# ------------------------------------------------------------------------------
# Expose ports
EXPOSE 80

# ------------------------------------------------------------------------------
# Define default command
CMD ["/app/app.sh"]
