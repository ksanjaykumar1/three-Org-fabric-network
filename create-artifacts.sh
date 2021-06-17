
sudo chmod 755 -R crypto-config
# create genesis block 
configtxgen -profile OrdererGenesis -channelID syschannel -outputBlock ./orderer/genesis.block

# creating called channel "MainChannel" defined 

configtxgen -profile MainChannel -outputCreateChannelTx ./channels/mainchannel.tx -channelID mainchannel

# creating anchor for both ibm and oracle , anchor peer is used to talk to other peers or communicate outside

configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/org1-anchors.tx -channelID main -asOrg org1
configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/org2-anchors.tx -channelID main -asOrg org2
configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/org3-anchors.tx -channelID main -asOrg org3
