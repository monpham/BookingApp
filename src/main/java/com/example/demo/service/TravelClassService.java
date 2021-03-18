package com.example.demo.service;

import com.example.demo.entity.TravelClass;
import com.example.demo.repository.TravelClassRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TravelClassService {
    @Autowired
    private TravelClassRepository travelClassRepository;

    public TravelClass getTravelClassByClassName (String className) {
        return travelClassRepository.findByClassName(className);
    }

}
