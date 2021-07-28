#!/bin/bash
CONTAINER_NAME="rocketpool_eth1"
GETH_VERSION=$( docker exec -i rocketpool_eth1 geth version | grep -Po "(?<=^Version: )[0-9\.]+" ) # See docker exec -i rocketpool_eth1 geth version
ETH1_DATA_VOLUME=$( docker inspect -f '{{ json .Mounts }}' $CONTAINER_NAME | jq -r '.[] | select(.Destination=="/ethclient").Source' )

echo "Stopping geth..."
docker stop $CONTAINER_NAME

echo "Running the pruner..."
docker run --rm -it -v $ETH1_DATA_VOLUME:/ethclient ethereum/client-go:v$GETH_VERSION snapshot prune-state --goerli --datadir /ethclient/geth
echo "Done pruning!"

echo "Starting geth..."
docker start $CONTAINER_NAME
