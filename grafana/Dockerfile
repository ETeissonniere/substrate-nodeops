FROM grafana/grafana:7.2.0

USER root
RUN chown grafana:grafana -R /etc/grafana/provisioning
RUN mkdir -p /var/lib/grafana/dashboards

USER grafana
COPY ./entrypoint.sh /entrypoint.sh
COPY ./dashboard.json /var/lib/grafana/dashboards/substrate.json
ENTRYPOINT ["/entrypoint.sh"]
