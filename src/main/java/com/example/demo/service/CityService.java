package com.example.demo.service;

import com.example.demo.entity.City;
import com.example.demo.repository.CityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityService {
    @Autowired
    private CityRepository cityRepository;
    public List<City> getAllCities(){return (List<City>) cityRepository.findAll();}
}
