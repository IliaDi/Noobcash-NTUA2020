#!/bin/sh


# functions='block_br'|'trans_br'|'init'

function=$1

echo "$(tput setaf 6)<Running: "$function">\n$(tput sgr0)"

case $function in
	init)
		num_of_nodes=$2
		# use: ./examples.sh init <number of nodes>
		curl http://localhost:5000/init/$num_of_nodes
		;;
	block_br)
		port=$2
		# use: ./examples.sh block_br <port>
		curl -d '{"previousHash":1,"timestamp":2,"nonce":3,"listOfTransactions":4,"blockHash":5}' -H "Content-Type: application/json" -X POST http://localhost:$port/receive_block			
		;;
	trans_br)
		# use: ./examples.sh init trans_br <port>
		port=$2
		curl -d '{"sender":1,"receiver":2,"amount":3,"id":4,"transaction_inputs":5,"transaction_outputs":6,"signature":7,"sender_privkey":8}' -H "Content-Type: application/json" -X POST http://localhost:$port/receive_trans
		;;
	connect)
		ip=$2
		port=$3
		# use: ./examples.sh connect <IP> <port>
		curl http://localhost:$port/connect/$ip/$port
		;;
	*)
esac
echo "\n$(tput setaf 6)<Done>$(tput sgr0)"