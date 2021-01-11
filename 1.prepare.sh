#!/bin/bash
CHAIN_ID=203
NETWORK_ID=203
NUM_CNS=1
PRIVATE_KEY=492cf9f1e9574e7f9f3e914dcf18117280cf238776ca715da47996ac1b36b98b
ADDRESS=0x09D790C4717dF9F71382b243f2A0B1DE34a36120

if [ 1 -ne $NUM_CNS ]; then
  echo "Currently, it only works for 1 CN configuration."
  exit
fi

# Download klaytn docker image.
docker pull klaytn/klaytn:latest

# Generate docker-compose.yml for docker-compose.
docker run --rm -v ${PWD}:/homi-output klaytn/klaytn homi setup -o /homi-output --docker-image-id klaytn/klaytn:latest --cn-num $NUM_CNS --chainID $CHAIN_ID --network-id $NETWORK_ID docker

# Update private key if necessary
if [ ! -z $PRIVATE_KEY ]; then
  echo "replacing private key."
	sed -ie "s/\(.*nodekeyhex \)\(.*\)\(\".*\)/\1$PRIVATE_KEY\3/" docker-compose.yml
	sed -ie "s/\(.*REWARDBASE=\)\(.*\)\(\'.*\)/\1$ADDRESS\3/" docker-compose.yml
fi

# Add the whale account to the node wallet.
PK=`grep "nodekeyhex" docker-compose.yml | sed "s/.*nodekeyhex \(.*\)\".*/\1/"`
REWARDBASE=`grep "REWARDBASE" docker-compose.yml | sed "s/.*REWARDBASE=\(.*\)\'.*/\1/"`
./add_import_key.py docker-compose.yml $PK $REWARDBASE
