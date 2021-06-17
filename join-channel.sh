docker exec -it cli-peer0-org1 bash -c 'peer channel create -c mainchannel -f ./channels/mainchannel.tx -o orderer0:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-7054.pem'

docker exec -it cli-peer0-org1 bash -c 'cp mainchannel.block ./channels/'
docker exec -it cli-peer0-org1 bash -c 'peer channel join -b channels/mainchannel.block'
docker exec -it cli-peer1-org1 bash -c 'peer channel join -b channels/mainchannel.block'
docker exec -it cli-peer0-org2 bash -c 'peer channel join -b channels/mainchannel.block'
docker exec -it cli-peer1-org2 bash -c 'peer channel join -b channels/mainchannel.block'
docker exec -it cli-peer0-org3 bash -c 'peer channel join -b channels/mainchannel.block'
docker exec -it cli-peer1-org3 bash -c 'peer channel join -b channels/mainchannel.block'

