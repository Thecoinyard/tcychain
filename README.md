# Setup a Consortium/Private network with PoA
# Clique documentation


https://github.com/ethereum/EIPs/issues/225


1. Create directories tcychain   node2
    * Chaindata will go under the subdirectory 'data'
2. Create accounts:
    * geth --datadir node1  account new
    0xBfE2FaB2C815B2Cf5ef42304aDa643224BB7d67a

    * geth --datadir node2  account new
    0xE7603BC91517D020ECfdAF34961FC0Ed7157b99D

3. Run the puppeth tool to generate the genesis.json file

4. Initialize tcychain/ & tcychain/node2

   cd tcychain
   geth --datadir ../tcychain/ init ../tcychain/tcychain.json

   cd node2
geth --datadir ../tcychain/node2/ init ../tcychain/tcychain.json
5. Setup bootnode 
   bash generatebootnode.sh
   * Launch Bootnode
   bash launchbootnode.sh
   * Get <<enode>> information for the bootnode
   enode://c3f0f217170860e38f9a3c467eacc45217b20b9530cec0b92490c6a97f3152a072cd4d9db06a21ab6e98cb459f205a8dc6c8e43ab3c57d873d72cfe4eaccee97@127.0.0.1:0?discport=30310

6. Set up the launch script for ./tcychain and ./tcychain/node2 with <<enode>> of bootnode
   * Hint use the script .../privnw_one/node1/launch.boot.sh

7. Launch commands for Starting the node1, node2

* Node 1 Launch command - Mining is ON
======================================
geth --networkid 252692 --datadir node1 --bootnodes 'enode://c3f0f217170860e38f9a3c467eacc45217b20b9530cec0b92490c6a97f3152a072cd4d9db06a21ab6e98cb459f205a8dc6c8e43ab3c57d873d72cfe4eaccee97@127.0.0.1:0?discport=30310'  --port  30303 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8545 --unlock 0xBfE2FaB2C815B2Cf5ef42304aDa643224BB7d67a --password password.txt --allow-insecure-unlock --mine console

* Node 2 Launch command
=======================
geth --networkid 252692 --datadir node1 --bootnodes 'enode://43c8317c04964cba19800e84674452c947b82bdd542051c944e48a291089e364ed764ff06b3501aedda8e61a9bae7c3a72ab343fb6639a1577f3a30e9729ee47@127.0.0.1:0?discport=30310'  --port  30304 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8546 --unlock 0x5813e7391b56a2e08ce5f6ac069d9eeb45ff84d8 --password password.txt   console


    * Node1 - Replace <<enode>>
    geth --networkid 252692 --datadir "./data" --bootnodes '<<enode>>'  --port  30303 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8545 --unlock --password password.txt console 

    * Node2 - Replace <<enode>>
    geth --networkid 252692 --datadir "./data" --bootnodes '<<enode>>'  --port  30304 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8546 --unlock --password "password.txt" console 

8. Deploy a contract on tcychain and execute the contract on tcychain/node2
   * Use any tool for execution
   * How about enabling RPC on both node1/node2 and using Remix 
     RPC ports need to be different for tcychain & tcychain/node2
   