# Setup a Consortium/Private network with PoA
# Clique documentation


https://github.com/ethereum/EIPs/issues/225


1. Create directories tcychain 
    * Chaindata will go under the subdirectory node1 & node2
2. Create accounts:
    * geth --datadir node1  account new
    

    * geth --datadir node2  account new
   

3. Run the puppeth tool to generate the genesis.json file

4. Initialize node1/ & node2

   cd tcychain
   geth --datadir node1 init tcychain-harmony.json

   cd node2
geth --datadir node2/ init tcychain-harmony.json
5. Setup bootnode 
   bash generatebootnode.sh
   * Launch Bootnode
   bash launchbootnode.sh
   * Get <<enode>> information for the bootnode
   enode://e00dcb0b9292af6be0ae750ee6a10fde27287c4314706c1b335e87b98fae22375d506f35b72c96fb17254b281a51722952ef3bcdc37b3bcc7e5e36d47c38f967@127.0.0.1:0?discport=30310

6. Set up the launch script for node1 and node2 with <<enode>> of bootnode
   *launchbootnode.sh

7. Launch commands for Starting the node1, node2

* Node 1 Launch command - Mining is ON
======================================
geth --networkid 2526 --datadir node1 --bootnodes 'enode://e00dcb0b9292af6be0ae750ee6a10fde27287c4314706c1b335e87b98fae22375d506f35b72c96fb17254b281a51722952ef3bcdc37b3bcc7e5e36d47c38f967@127.0.0.1:=30310'  --port  30311 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8545 --unlock <Your Wallet> --password password.txt --allow-insecure-unlock --mine console

* Node 2 Launch command
=======================
geth --networkid 2526 --datadir node1 --bootnodes 'enode://e00dcb0b9292af6be0ae750ee6a10fde27287c4314706c1b335e87b98fae22375d506f35b72c96fb17254b281a51722952ef3bcdc37b3bcc7e5e36d47c38f967@127.0.0.1:=30310'  --port  30311 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8545 --unlock <Your Wallet> --password password.txt --allow-insecure-unlock --mine console


    * Node1 - Replace <<enode>>
    geth --networkid 252692 --datadir "./data" --bootnodes '<<enode>>'  --port  30303 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8545 --unlock --password password.txt console 

    * Node2 - Replace <<enode>>
    geth --networkid 252692 --datadir "./data" --bootnodes '<<enode>>'  --port  30304 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8546 --unlock --password "password.txt" console 

8. Deploy a contract on tcychain and execute the contract on tcychain/node2
   * Use any tool for execution
   * How about enabling RPC on both node1/node2 and using Remix 
     RPC ports need to be different for tcychain & tcychain/node2
   