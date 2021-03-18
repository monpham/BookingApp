package com.example.demo.service;

import com.example.demo.entity.Country;
import com.example.demo.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CountryService {
    @Autowired
    private CountryRepository countryRepository;

    public List<String> getAllCountriesName () {
        List<Country> countries = (List<Country>) countryRepository.findAll();
        List<String> countryNames = new ArrayList<>();
        if (!countries.isEmpty()) {
            for (Country c: countries) {
                countryNames.add(c.getCountryName());
            }
        }

        return countryNames;
    }
}
