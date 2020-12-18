if [ ! -z $PRIVATE_KEY ]; then
	sed -ie "s/\(.*nodekeyhex \)\(.*\)\(\".*\)/\1$PRIVATE_KEY\3/" docker-compose.yml
	sed -ie "s/\(.*REWARDBASE=\)\(.*\)\(\'.*\)/\1$ADDRESS\3/" docker-compose.yml
fi

