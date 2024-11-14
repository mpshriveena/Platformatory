package com.platformatory;

import io.confluent.kafka.serializers.KafkaAvroDeserializer;
import io.confluent.kafka.serializers.KafkaAvroDeserializerConfig;
import org.apache.avro.generic.GenericRecord;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import java.time.Duration;
import java.util.Collections;
import java.util.Properties;
import java.util.List;

public class App {
    public static void main(String[] args) {
        // Kafka Consumer configuration
        Properties props = new Properties();
props.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
props.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
props.put(ConsumerConfig.GROUP_ID_CONFIG, "your-group-id6");
props.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
props.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
props.put(KafkaAvroDeserializerConfig.SPECIFIC_AVRO_READER_CONFIG, true);
props.put("schema.registry.url", "http://localhost:8081");

KafkaConsumer<String, GenericRecord> consumer = new KafkaConsumer<>(props);
consumer.subscribe(Collections.singletonList("avro_topic1"));

while (true) {
    ConsumerRecords<String, GenericRecord> records = consumer.poll(Duration.ofMillis(1000));
    for (ConsumerRecord<String, GenericRecord> record : records) {
        System.out.println("Key: " + record.key());
        System.out.println("Value: " + record.value());
    }
}
    }
}
