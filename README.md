# Setup a Consortium/Private network with PoA
# Clique documentation


https://github.com/ethereum/EIPs/issues/225


1. Create directories tcychain   node2
    * Chaindata will go under the subdirectory 'data'
2. Create accounts:
    * geth --datadir ../tcychain/db  account new
    032912627010921a7A587a6c1EA550B3Ae69Ae52

    * geth --datadir ../tcychain/node2/db  account new
    38FD1ffB08792F547546514Fb4faC4f534660eE8

3. Run the puppeth tool to generate the genesis.json file

4. Initialize tcychain/ & tcychain/node2

   cd tcychain
   geth --datadir ../tcychain init ../genesis.json

   cd node2
   geth --datadir ../tcychain/b init ../genesis.json

5. Setup bootnode 
   * we will use the bootnode setup under ../privnw_one/bnode
   * Launch Bootnode
   * Get <<enode>> information for the bootnode

6. Set up the launch script for ./tcychain and ./tcychain/node2 with <<enode>> of bootnode
   * Hint use the script .../privnw_one/node1/launch.boot.sh

7. Launch commands for Starting the node1, node2

* Node 1 Launch command - Mining is ON
======================================
geth --networkid 252692 --datadir "./data" --bootnodes 'enode://83cab5439021f0dcad5a12faa2c628c212bc072d78d2ebf5dd80c3cdd0d625f262bbac924492f5e0c0ce1140fdbfc569dfa5893615e386395bca2f61f551b722@127.0.0.1:30310'  --port  30303 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8545 --unlock bc758cc69671f3bb2a4f0ab9aa3ca233d0074c0a --password password.txt --mine console

* Node 2 Launch command
=======================
geth --networkid 1015 --datadir "./data" --bootnodes 'enode://83cab5439021f0dcad5a12faa2c628c212bc072d78d2ebf5dd80c3cdd0d625f262bbac924492f5e0c0ce1140fdbfc569dfa5893615e386395bca2f61f551b722@127.0.0.1:30310'  --port  30304 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8546 --unlock 0x5813e7391b56a2e08ce5f6ac069d9eeb45ff84d8 --password password.txt   console


    * Node1 - Replace <<enode>>
    geth --networkid 252692 --datadir "./data" --bootnodes '<<enode>>'  --port  30303 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8545 --unlock --password password.txt console 

    * Node2 - Replace <<enode>>
    geth --networkid 252692 --datadir "./data" --bootnodes '<<enode>>'  --port  30304 --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport 8546 --unlock --password "password.txt" console 

8. Deploy a contract on tcychain and execute the contract on tcychain/node2
   * Use any tool for execution
   * How about enabling RPC on both node1/node2 and using Remix 
     RPC ports need to be different for tcychain & tcychain/node2
   