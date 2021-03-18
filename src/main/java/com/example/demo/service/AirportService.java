package com.example.demo.service;

import com.example.demo.entity.Airport;
import com.example.demo.repository.AirportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AirportService {
    @Autowired
    private AirportRepository airportRepository;

    public List<Airport> getAllAirports() {
        return (List<Airport>) airportRepository.findAll();
    }

    public Airport getAirportByCityName (String cityName) {
        return airportRepository.findByCityCityName(cityName);
    }
    public Map<Integer, String> getAllAirportsWithMapType() {
        List<Airport> airportList = getAllAirports();
        Map<Integer, String> airports = new HashMap<>();

        if (!airportList.isEmpty()) {
            for (Airport a : airportList) {
                airports.put(a.getAirportId(), a.getAirportName());
            }
        }
        return airports;
    }
    public boolean saveAirport(Airport airport){
        try{
            airportRepository.save(airport);
            return  true;
        }catch (Exception ex){
            return false;
        }
    }
    public boolean deleteAirport(int id){
        try {
            airportRepository.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public boolean isException(Airport airport){
        return airportRepository.existsByAirportName(airport.getAirportName());
    }
    public Airport getAirportById(int id){
        return airportRepository.findByAirportId(id);
    }
}
