FROM debian:stretch-slim

RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        apt-transport-https bash-completion ca-certificates curl && \
    apt-get clean && apt-get --yes --quiet autoremove --purge

RUN curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

COPY serve-server /home/serve-server
COPY docker-compose.yml /home/docker-compose.yml
RUN chmod +x /home/serve-server

WORKDIR "/home"
CMD TZ=${TZ} ./serve-server