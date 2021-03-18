package com.example.demo;

import com.example.demo.entity.Flight;
import com.example.demo.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

import java.util.List;

@SpringBootApplication
public class DemoApplication {
    @Autowired
    private static FlightService flightService;
    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

}
