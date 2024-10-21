Clone the Starter Project and Run It to Verify That It Works

    Clone the starter project into the home directory:

cd ~/

git clone https://github.com/linuxacademy/content-ccdak-kafka-producer-lab.git

    View the creation of the content-ccdak-kafka-producer-lab directory:

ls

    Run the code to ensure it works before modifying it:

cd content-ccdak-kafka-producer-lab/

./gradlew run

Note: We should see a Hello, world! message in the output.
Implement the Producer and Run It to Verify That It Works as Expected

    Edit the main class:

vi src/main/java/com/linuxacademy/ccdak/producer/Main.java

    Implement the producer according to the provided specification:

package com.linuxacademy.ccdak.producer;



import java.io.BufferedReader;

import java.io.File;

import java.io.FileReader;

import java.io.IOException;

import java.util.Properties;

import org.apache.kafka.clients.producer.KafkaProducer;

import org.apache.kafka.clients.producer.Producer;

import org.apache.kafka.clients.producer.ProducerRecord;



public class Main {



    public static void main(String[] args) {

        Properties props = new Properties();

        props.put("bootstrap.servers", "localhost:9092");

        props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");

        props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");



        props.put("acks", "all");



        Producer<String, String> producer = new KafkaProducer<>(props);



        try {

            File file = new File(Main.class.getClassLoader().getResource("sample_transaction_log.txt").getFile());

            BufferedReader br = new BufferedReader(new FileReader(file));

            String line;

            while ((line = br.readLine()) != null) {

                String[] lineArray = line.split(":");

                String key = lineArray[0];

                String value = lineArray[1];

                producer.send(new ProducerRecord<>("inventory_purchases", key, value));

                if (key.equals("apples")) {

                    producer.send(new ProducerRecord<>("apple_purchases", key, value));

                }

            }

            br.close();

        } catch (IOException e) {

            throw new RuntimeException(e);

        }



        producer.close();

    }



}

    Save and exit.
    Execute the program:

./gradlew run

Note: We should see a BUILD SUCCESSFUL message.

    Consume the records from the inventory_purchases topic and verify that we can see the new records created by the producer:

kafka-console-consumer --bootstrap-server localhost:9092 --topic inventory_purchases --property print.key=true --from-beginning

    Consume the records from the apple_purchases topic to verify that we can see the new records created by the producer:

kafka-console-consumer --bootstrap-server localhost:9092 --topic apple_purchases --property print.key=true --from-beginning
