FROM debian:bookworm-slim

RUN set -ex \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
     ncmpcpp \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && useradd --uid 71723 -m ncmpcpp

COPY entrypoint.sh /entrypoint.sh
RUN mkdir -p /home/ncmpcpp/.ncmpcpp \
   && mkdir -p /root/.ncmpcpp
COPY config /home/ncmpcpp/.ncmpcpp/config
COPY config /root/.ncmpcpp/config

RUN set -ex \
 && chmod o+rx /entrypoint.sh 
ENV TERM xterm-256color
USER ncmpcpp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/ncmpcpp"]
