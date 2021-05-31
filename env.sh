#!/bin/bash
ENV=${1:-dev}
unset MINER
echo "Switching to $ENV environment"
if [ "$ENV" == "vagrant" ]
then 
    MINER="vagrant = ansible_host=127.0.0.1 ansible_port=2222"
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
