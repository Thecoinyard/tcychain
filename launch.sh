

geth --networkid 252692 --datadir node1 --bootnodes 'enode://c3f0f217170860e38f9a3c467eacc45217b20b9530cec0b92490c6a97f3152a072cd4d9db06a21ab6e98cb459f205a8dc6c8e43ab3c57d873d72cfe4eaccee97@127.0.0.1:0?discport=30310'  --port  30303 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcaddr '0.0.0.0' --rpcapi 'personal,db,eth,net,web3,txpool,miner' --rpcport 8545 --unlock 0xBfE2FaB2C815B2Cf5ef42304aDa643224BB7d67a --password password.txt --allow-insecure-unlock --mine console
