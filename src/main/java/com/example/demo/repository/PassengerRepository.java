package com.example.demo.repository;

import com.example.demo.entity.Passenger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PassengerRepository extends CrudRepository<Passenger, Integer> {
    Passenger findByPassportId(String passportId);
    Passenger findByPassengerId(String passengerId);
}
