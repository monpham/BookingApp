package com.example.demo.service;

import com.example.demo.entity.Passenger;
import com.example.demo.repository.PassengerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PassengerService {
    @Autowired
    private PassengerRepository passengerRepository;
    public Passenger getPassengerByPassportId (String passportId) {
        return passengerRepository.findByPassportId(passportId);
    }
    public Passenger getPassengerByPassengerId (String passengerId) {
        return passengerRepository.findByPassengerId(passengerId);
    }

    public void saveNewPassenger (Passenger passenger) {
        passengerRepository.save(passenger);
    }
}
