
    #Add the GPG key:
    wget -qO - https://packages.confluent.io/deb/5.2/archive.key | sudo apt-key add -
    #Add the package repository:
    sudo add-apt-repository "deb [arch=amd64] https://packages.confluent.io/deb/5.2 stable main"
    #Install Confluent Community and Java:
    sudo apt-get update && sudo apt-get install -y openjdk-8-jre-headless confluent-community-2.12

#Start Zookeeper and Kafka

    #Start and enable the Zookeeper and Kafka services:
    sudo systemctl start confluent-zookeeper
    sudo systemctl enable confluent-zookeeper
    sudo systemctl start confluent-kafka
    sudo systemctl enable confluent-kafka
    #On each server, check the services to make sure they are running:
    sudo systemctl status confluent*
    #Both services should be active (running) on all three servers.
    #Test the cluster by listing the current topics:
    kafka-topics --list --bootstrap-server localhost:9092
    #The output should look like this:
    #_confluent.support.metrics
