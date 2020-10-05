#!/bin/sh

export TARGET_STRING="["
for target in $@; do
    if [ "$1" = "$target" ]; then
        separator=""
    else
        separator=","
    fi
    export TARGET_STRING="$TARGET_STRING $separator \"$target\" "
done
export TARGET_STRING="$TARGET_STRING ]"

echo $TARGET_STRING

cat << EOF > config.yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: "prometheus"
    scrape_interval: 5s
    static_configs:
      - targets: ["localhost:9090"]
  - job_name: "substrate_node"
    scrape_interval: 5s
    static_configs:
      - targets: $TARGET_STRING
EOF

echo "configuration written!"

chmod 0777 config.yml
prometheus --config.file `pwd`/config.yml --storage.tsdb.path /data --web.listen-address="0.0.0.0:9090"
