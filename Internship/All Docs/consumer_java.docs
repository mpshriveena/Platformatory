Clone the Starter Project from GitHub and Perform a Test Run

    Clone the starter project from GitHub:

    cd ~/
    git clone https://github.com/linuxacademy/content-ccdak-kafka-simple-consumer.git

    Note: We can use ls to view the folder named after the repository.

    Perform a test to make sure the code is able to compile and run:

    cd content-ccdak-kafka-simple-consumer/
    ./gradlew run

    The output should contain the message printed by the main class: Hello, world!.

Implement a Consumer in the Main Class and Run It

    Add the Kafka Client Libraries as a project dependency in build.gradle with:

    vi build.gradle

    In the dependencies { ... } block, add the following line:

    implementation 'org.apache.kafka:kafka-clients:2.2.1'

    Edit the Main class:

    vi src/main/java/com/linuxacademy/ccdak/kafkaSimpleConsumer/Main.java

    Implement a basic consumer that consumes messages from the topic and prints them to the screen:

    package com.linuxacademy.ccdak.kafkaSimpleConsumer;

    import org.apache.kafka.clients.consumer.*;
    import java.util.Properties;
    import java.util.Arrays;
    import java.time.Duration;

    public class Main {

        public static void main(String[] args) {
            Properties props = new Properties();
            props.setProperty("bootstrap.servers", "localhost:9092");
            props.setProperty("group.id", "my-group");
            props.setProperty("enable.auto.commit", "true");
            props.setProperty("auto.commit.interval.ms", "1000");
            props.setProperty("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
            props.setProperty("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
            KafkaConsumer<String, String> consumer = new KafkaConsumer<String, String>(props);
            consumer.subscribe(Arrays.asList("inventory_purchases"));
            while (true) {
                ConsumerRecords<String, String> records = consumer.poll(Duration.ofMillis(100));
                for (ConsumerRecord<String, String> record : records) {
                    System.out.printf("offset = %d, key = %s, value = %s%n", record.offset(), record.key(), record.value());
                }
            }
        }

    }

    Save and exit.

    Run the code:

    ./gradlew run

    The program should print a series of messages from the Kafka topic containing information about item purchases. We should see an offset, key, value, id, product, and quantity listed for each record in the output.

    Note: Use the Ctrl + C keyboard shortcut to stop printing messages.
