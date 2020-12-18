#!/bin/bash
CHAIN_ID=203
NUM_CNS=1

# Download klaytn docker image.
docker pull klaytn/klaytn:latest

# Generate docker-compose.yml for docker-compose.
docker run --rm -v ${PWD}:/homi-output klaytn/klaytn homi setup -o /homi-output --docker-image-id klaytn/klaytn:latest --cn-num $NUM_CNS --chainID $CHAIN_ID docker

# Add the whale account to the node wallet.
PK=`grep "nodekeyhex" docker-compose.yml | sed "s/.*nodekeyhex \(.*\)\".*/\1/"`
echo $PK
./add_import_key.py docker-compose.yml $PK
