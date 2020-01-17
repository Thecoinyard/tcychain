# Copy Paste this command in ....../privnw_poa/node1
# Boot node should be running
# This is the sealer node
geth --networkid 252692 --mine --datadir "../tcychain"  --port  30303 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8501 --unlock 0x2299e9A8b7D5bc1AFD29c777909ee5d8146dBa6E --password password.txt --bootnodes 'enode://87f45d44c26743b786d97b5bc6e09d90d05c028e51132f0ae3b163a2afaf74099bd7a0209561a7c61a3010fac28b22dbfae410c8e031f208203595d7b7846b0c@127.0.0.1:0?discport=30310'  console