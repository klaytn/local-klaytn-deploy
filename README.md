# Branch name will be changed

We will change the `master` branch to `main` on Nov 1, 2022.
After the branch policy change, please check your local or forked repository settings.

# Local Deployment Tool for Klaytn

<!-- vim-markdown-toc GFM -->

* [Deploying the local Network](#deploying-the-local-network)
	* [Prerequisites](#prerequisites)
	* [Starting the Klaytn Network](#starting-the-klaytn-network)
		* [Chainging parameters](#chainging-parameters)
	* [Checking out the Status of the Network](#checking-out-the-status-of-the-network)
	* [Getting logs](#getting-logs)
	* [Stopping the Network](#stopping-the-network)
	* [Resuming the Network](#resuming-the-network)
	* [Terminate the Network](#terminate-the-network)
* [Developing Smart Contracts on the Local Network](#developing-smart-contracts-on-the-local-network)
	* [Using KlaytnIDE](#using-klaytnide)

<!-- vim-markdown-toc -->

# Deploying the local Network

## Prerequisites
Following packages are required.

1. [Docker](https://docs.docker.com/get-docker/)
1. [Docker-compose](https://docs.docker.com/compose/install/)

## Starting the Klaytn Network
Execute the following scripts:

```bash
$ ./1.prepare.sh
$ ./2.start.sh
```

It deployes 1 KCN network by default. 


### Chainging parameters
You can change two parameters in `1.prepare.sh`.

| Parameter | Description |
|---|---|
|CHAIN_ID| The chain ID of the deployed chain. (Default:203) |
|NETWORK_ID| The network ID of the deployed chain. It would be better to set this value to the same value of CHAIN_ID for simplicity. (Default:203) |
|NUM_CNS| Number of CNs of the network. (Default:1) |
| PRIVATE_KEY | The private key of the genesis account having all KLAY. If not set, it is auto-generated. |
| ADDRESS | The address of the genesis account. This address must be matched to PRIVATE_KEY. |

## Checking out the Status of the Network
To check out the local Klaytn network is working well, first check the status of the docker containers. To do that, execute the following command:

```bash
$ ./3.status.sh
```

## Getting logs
After executing `2.start.sh`, it prints logs for the klaytn network.
If you want to print out the logs in another shell, execute the following command:

```bash
$ ./4.logs.sh
```

## Stopping the Network
To stop the network to reduce resource utilzation of your machine, execute the following command:

```bash
$ ./5.stop.sh
```

## Resuming the Network
To resume the stopped network, execute the following command:

```bash
$ ./6.resume.sh
```

## Terminate the Network
To terminate all the resources in your machine, execute the following command:

```bash
$ ./7.terminate.sh
```

**Note** All the transactions and blocks you made will be lost.

# Developing Smart Contracts on the Local Network

## Using KlaytnIDE

[KlaytnIDE](https://ide.klaytn.com) is an IDE (Integrated Development Environment) for Klaytn.
By changing Environment on the "Run" tab to "Caver Provider" with `http://localhost:8551`,
you can easily connect to the local Klaytn network. Enjoy developing!

