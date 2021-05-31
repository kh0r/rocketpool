#!/bin/bash
ENV=${1:-dev}
unset MINER
echo "Switching to $ENV environment"
if [ "$ENV" == "vagrant" ]
then 
    MINER="vagrant-miner = ansible_host=127.0.0.1 ansible_port=2222"
    rm inventory/hcloud.yaml 2> /dev/null
else
    echo "
plugin: hcloud
groups:
  miners: \"'miner' in (labels|list)\"
" > inventory/hcloud.yaml
fi

echo "
localhost = ansible_connection=local

[miners]
$MINER

[$ENV:children]
miners

[$ENV]
localhost
" > inventory/hosts
