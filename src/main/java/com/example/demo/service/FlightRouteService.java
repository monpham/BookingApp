package com.example.demo.service;

import com.example.demo.entity.Airport;
import com.example.demo.entity.FlightRoute;
import com.example.demo.repository.AirportRepository;
import com.example.demo.repository.FlightRouteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FlightRouteService {
    @Autowired
    private FlightRouteRepository flightRouteRepository;

    @Autowired
    private AirportRepository airportRepository;

    public List<FlightRoute> getAllFlightRouteByOriginCityName (String originCityName) {
        return flightRouteRepository.findByOriginCityName(originCityName);
    }

    public List<String> getAllDestinationCityNamesWithOriginCityName (String originCityName) {
        List<FlightRoute> flightRouteList = getAllFlightRouteByOriginCityName(originCityName);
        List<String> destinationName = new ArrayList<>();

        for (FlightRoute f: flightRouteList) {
            destinationName.add(f.getDestinationAirport().getCity().getCityName());
        }
        return destinationName;

    }


    public List<FlightRoute> getAllFlightRoute() {
        return (List<FlightRoute>) flightRouteRepository.findAll();
    }

    public List<FlightRoute> getAllFlightRoutesByOriginName(String origin) {
        return flightRouteRepository.findByOriginName(origin);
    }

    public List<String> getAllDestinationsNameByOriginName(String origin) {
        List<String> destinations = new ArrayList<>();

        for (FlightRoute fr : getAllFlightRoutesByOriginName(origin)) {
            destinations.add(fr.getDestinationAirport().getAirportName());
        }
        return destinations;
    }
/*    public Map<Integer, String> getAllFlightRouteNameWithMap (){
        List<FlightRoute> routeList = getAllFlightRoute();
        Map<Integer, String> routes = new HashMap<>();
        if (!routeList.isEmpty()){
            for (FlightRoute fr: routeList){
                routes.put(fr.getRouteId(), fr.getOriginAirport().getAirportName());
            }
        }
        return routes;
    }*/

    //Get All Origins (places) to fill in origin input
    public Map<Integer, String> getAllOriginsWithMapType() {
        List<Airport> airports = (List<Airport>) airportRepository.findAll();
        Map<Integer, String> origins = new HashMap<>();

        if (!airports.isEmpty()) {
            int count = 1;
            for (Airport a : airports) {
                origins.put(count++, a.getAirportName());
            }
        }
        return origins;
    }

    public FlightRoute getFlightRouteById(int id) {
        return flightRouteRepository.findByRouteId(id);
    }

    public boolean saveFlightRoute(FlightRoute flightRoute) {
        try {
            flightRouteRepository.save(flightRoute);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean deleteFlightRoute(int id) {
        try {
            flightRouteRepository.deleteById(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
