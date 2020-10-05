FROM prom/prometheus:v2.21.0

COPY ./entrypoint.sh /entrypoint.sh

USER root
RUN mkdir /data && chown nobody:nogroup /data

USER nobody
ENTRYPOINT ["/entrypoint.sh"]