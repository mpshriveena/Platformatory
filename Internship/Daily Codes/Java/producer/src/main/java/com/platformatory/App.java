package com.platformatory;

import org.apache.kafka.clients.producer.*;
import java.util.Properties;
import java.util.Arrays;

public class App{
    public static void main(String[] args) {
        Properties props = new Properties();
        props.put("bootstrap.servers", "localhost:9092");
        props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        Producer<String,String> producer = new KafkaProducer<>(props);
        for(int i=1;i<1000; i++){
            if(i%2==0){
            producer.send(new ProducerRecord<String,String>("own-producer-trial","Even",Integer.toString(i)));
        }
    }
        producer.close();
    }

}

