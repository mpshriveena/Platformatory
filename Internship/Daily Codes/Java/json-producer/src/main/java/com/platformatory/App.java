package com.platformatory;

import org.apache.kafka.clients.producer.*;
import org.apache.kafka.common.serialization.StringSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.IOException;
import java.util.Properties;

class Person {
    private String name;
    private int age;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
}

public class App {
    public static void main(String[] args) {
        Properties props = new Properties();
        props.put("bootstrap.servers", "localhost:9092");
        props.put("key.serializer", StringSerializer.class.getName());
        props.put("value.serializer", StringSerializer.class.getName());
        Producer<String, String> producer = new KafkaProducer<>(props);
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            File jsonFile = new File("data.json");
            Person[] people = objectMapper.readValue(jsonFile, Person[].class);
            for (Person person : people) {
                String jsonString = objectMapper.writeValueAsString(person);
                ProducerRecord<String, String> record = new ProducerRecord<>("json-data", person.getName(), jsonString);
                producer.send(record);
            }
        System.out.println("Messages sent to topic successfully!");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            producer.close();
        }
    }
}

