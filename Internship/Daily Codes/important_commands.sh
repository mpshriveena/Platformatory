sudo systemct start confluent-zookeeper
sudo systemct status confluent-zookeeper

sudo systemct start confluent-kafka
sudo systemct status confluent-kafka

sudo systemct start confluent-kafka-connect
sudo systemct status confluent-kafka-connect

sudo systemct start confluent-schema-registry
sudo systemct status confluent-schema-registry

kafka-topic --version

kafka-topics --bootstrap-server localhost:9092 --topic example_topic --create --partitions 1 --replication-factor 1
kafka-topics --bootstrap-server localhost:9092 --list
kafka-topics --bootstrap-server localhost:9092 --describe
kafka-topics --bootstrap-server localhost:9092 --topic example_topic --describe

kafka-console-producer --bootstrap-server localhost:9092 --topic example_topic
kafka-console-producer --bootstrap-server localhost:9092 --topic example_topic --property parse.key=true --property key.separator=:

kafka-console-consumer --bootstrap-server localhost:9092 --topic example_topic
kafka-console-consumer --bootstrap-server localhost:9092 --topic example_topic --from-beginning

curl http://localhost:8083/connectors/file_source_connector
curl http://localhost:8083/connectors/file_source_connector/status

curl -X DELETE http://localhost:8083/connectors/file_source_connector

kafka-console-producer --bootstrap-server localhost:9093 --topic example_topic --producer.config client-ssl.properties
kafka-console-consumer --bootstrap-server localhost:9093 --topic example_topic --from-beginning --consumer.config client-ssl.properties

kafka-console-producer --bootstrap-server localhost:9094 --topic example_topic --producer.config client-sasl.properties
kafka-console-consumer --bootstrap-server localhost:9094 --topic example_topic --from-beginning --consumer.config client-sasl.properties

sudo nano /etc/kafka/server.properties
sudo nano client-ssl.properties
sudo nano client-sasl.properties

sudo find / -name '*schema-registry*.properties'
sudo tail -f /var/log/kafka/server.log
sudo tail -n 50 /var/log/kafka/server.log
sudo netstat -tuln

kafka-acls --authorizer-properties zookeeper.connect=localhost:2181 --add --allow-principal User:Platformatory --operation all --topic acl-test