# Local Deployment Tool for Klaytn

<!-- vim-markdown-toc GFM -->

* [Deploying the local Network](#deploying-the-local-network)
  * [Prerequisites](#prerequisites)
  * [Starting the Klaytn Network](#starting-the-klaytn-network)
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
$ 1.prepare.sh
$ 2.start.sh
```

It deployes 1 KCN network by default. You can change two parameters in `1.prepare.sh`.

| Parameter | Description |
|---|---|
|CHAIN_ID| ID of the deployed chain. (Default:203) |
|NUM_CNS| Number of CNs of the network. (Default:1) |

## Getting logs
After executing `2.start.sh`, it prints logs for the klaytn network.
If you want to print out the logs in another shell, execute the following command:

```bash
$ 3.logs.sh
```

## Stopping the Network
To stop the network to reduce resource utilzation of your machine, execute the following command:

```bash
$ 4.stop.sh
```

## Resuming the Network
To resume the stopped network, execute the following command:

```bash
$ 5.resume.sh
```

## Terminate the Network
To terminate all the resources in your machine, execute the following command:

```bash
$ 6.terminate.sh
```

**Note** All the transactions and blocks you made will be lost.

# Developing Smart Contracts on the Local Network

## Using KlaytnIDE

[KlaytnIDE](https://ide.klaytn.com) is an IDE (Integrated Development Environment) for Klaytn.
By changing Environment on the "Run" tab to "Caver Provider" with `http://localhost:8551`,
you can easily connect to the local Klaytn network. Enjoy developing!

