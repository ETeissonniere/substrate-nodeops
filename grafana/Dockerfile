FROM grafana/grafana:7.2.0

USER root
RUN chown grafana:grafana -R /etc/grafana/provisioning

USER grafana
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
