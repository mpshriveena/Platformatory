#Starting Zookeeper
zookeeper-server-start.sh ~/kafka_2.13-3.8.0/config/zookeeper.properties

#Starting Kafka
kafka-server-start.sh ~/kafka_2.13-3.8.0/config/server.properties

#Starting Kafka Confluent Rest API
./bin/kafka-rest-start ./etc/kafka-rest/kafka-rest.properties

#Using Confluent Community
#Start and enable
sudo systemctl start confluent-zookeeper
sudo systemctl enable confluent-zookeeper
sudo systemctl start confluent-kafka
sudo systemctl enable confluent-kafka
#Status
sudo systemctl status confluent-zookeeper
sudo systemctl status confluent-kafka
sudo systemctl status confluent*
#Stop
sudo systemctl stop confluent-zookeeper
sudo systemctl stop confluent-kafka
