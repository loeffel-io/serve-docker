FROM debian:stretch-slim

RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        apt-transport-https bash-completion ca-certificates curl && \
    apt-get clean && apt-get --yes --quiet autoremove --purge

COPY ./serve /home/serve
RUN chmod +x /home/serve

WORKDIR "/home"
CMD TZ=${TZ} ./serve