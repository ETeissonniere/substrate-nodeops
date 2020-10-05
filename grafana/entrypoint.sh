#!/bin/sh

cat << EOF > /tmp/grafana.yml
apiVersion: 1
deleteDatasources:
- name: Prometheus
  orgId: 1
datasources:
- name: Prometheus
  type: prometheus
  access: proxy
  orgId: 1
  url: $1
  isDefault: true
  version: 1
  editable: false
EOF

# TODO: add dashboard

/run.sh --config /tmp/grafana.yml
