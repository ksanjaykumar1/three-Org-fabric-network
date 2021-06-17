docker exec -it cli-peer0-org1 bash -c 'peer lifecycle chaincode package resource_types.tar.gz --path /opt/gopath/src/resource_types --lang golang --label resource_types_1' 
docker exec -it cli-peer1-org1 bash -c 'peer lifecycle chaincode package resource_types.tar.gz --path /opt/gopath/src/resource_types --lang golang --label resource_types_1' 
docker exec -it cli-peer0-org2 bash -c 'peer lifecycle chaincode package resource_types.tar.gz --path /opt/gopath/src/resource_types --lang golang --label resource_types_1' 
docker exec -it cli-peer1-org2 bash -c 'peer lifecycle chaincode package resource_types.tar.gz --path /opt/gopath/src/resource_types --lang golang --label resource_types_1'
docker exec -it cli-peer0-org3 bash -c 'peer lifecycle chaincode package resource_types.tar.gz --path /opt/gopath/src/resource_types --lang golang --label resource_types_1' 
docker exec -it cli-peer1-org3 bash -c 'peer lifecycle chaincode package resource_types.tar.gz --path /opt/gopath/src/resource_types --lang golang --label resource_types_1'

docker exec -it cli-peer0-org1 bash -c 'peer lifecycle chaincode install resource_types.tar.gz &> pkg.txt' 
docker exec -it cli-peer1-org1 bash -c 'peer lifecycle chaincode install resource_types.tar.gz' 
docker exec -it cli-peer0-org2 bash -c 'peer lifecycle chaincode install resource_types.tar.gz &> pkg.txt' 
docker exec -it cli-peer1-org2 bash -c 'peer lifecycle chaincode install resource_types.tar.gz'
docker exec -it cli-peer0-org3 bash -c 'peer lifecycle chaincode install resource_types.tar.gz &> pkg.txt' 
docker exec -it cli-peer1-org3 bash -c 'peer lifecycle chaincode install resource_types.tar.gz'



docker exec -it cli-peer0-org1 bash -c 'peer lifecycle chaincode approveformyorg -o orderer0:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-7054.pem --collections-config /opt/gopath/src/resource_types/collections-config.json --channelID mainchannel --name resource_types --version 1.0 --sequence 1 --package-id $(tail -n 1 pkg.txt | awk '\''NF>1{print $NF}'\'')' 
docker exec -it cli-peer0-org2 bash -c 'peer lifecycle chaincode approveformyorg -o orderer0:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-7054.pem --collections-config /opt/gopath/src/resource_types/collections-config.json --channelID mainchannel --name resource_types --version 1.0 --sequence 1 --package-id $(tail -n 1 pkg.txt | awk '\''NF>1{print $NF}'\'')'
docker exec -it cli-peer0-org3 bash -c 'peer lifecycle chaincode approveformyorg -o orderer0:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-7054.pem --collections-config /opt/gopath/src/resource_types/collections-config.json --channelID mainchannel --name resource_types --version 1.0 --sequence 1 --package-id $(tail -n 1 pkg.txt | awk '\''NF>1{print $NF}'\'')'

docker exec -it cli-peer0-org1 bash -c 'peer lifecycle chaincode commit -o orderer0:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-7054.pem --collections-config /opt/gopath/src/resource_types/collections-config.json --channelID mainchannel --name resource_types --version 1.0 --sequence 1'