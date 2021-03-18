package com.example.demo.service;

import com.example.demo.entity.*;
import com.example.demo.repository.FlightRepository;
import com.example.demo.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class FlightService {
    @Autowired
    private FlightRepository flightRepository;

    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private TicketService ticketService;
    //Search flights
    public List<Flight> getAllOneWayFlightsBySearchConditions (String origin, String destination, LocalDateTime departureDate,LocalDateTime departureDate2,int numberOfPeople){
        List<Flight> flights = flightRepository.findFlightsByFlightRouteAndDepartureTime(origin, destination,departureDate, departureDate2);
        List<Flight> flightsFiltered = new ArrayList<>();
        if (!flights.isEmpty()){
            for (Flight f: flights){
                List<Ticket> tickets = ticketRepository.findByFlightAndEnabled(f, true);
                if (tickets.size() >= numberOfPeople) {
                    System.out.println(f.getFlightId());
                    flightsFiltered.add(f);
                }
            }
        }
        return flightsFiltered;
    }
    public List<Flight> getAllOneWayFlightsBySearchConditionsWithTravelClass (String origin, String destination, LocalDateTime departureDate,LocalDateTime departureDate2,int numberOfPeople, String travelClass){
        List<Flight> flights = flightRepository.findFlightsByFlightRouteAndDepartureTime(origin, destination,departureDate, departureDate2);
        List<Flight> flightsFiltered = new ArrayList<>();
        if (!flights.isEmpty()){
            for (Flight f: flights){
                List<Ticket> tickets = ticketRepository.findByFlightAndEnabledAndTravelClassClassName(f, true, travelClass);
                if (tickets.size() >= numberOfPeople) {
                    System.out.println(f.getFlightId());
                    flightsFiltered.add(f);
                }
            }
        }
        return flightsFiltered;
    }

   /* public List<Flight> getAllFlightsTest (LocalDateTime date, LocalDateTime date2){
        return flightRepository.findByDepartureTimeHere(date, date2);
    }
    public List<Flight> getAllFlightsByDepartureDate (LocalDateTime date, LocalDateTime date2){
        return flightRepository.findByDepartureTimeBetween(date, date2);
    }*/
    //
    public List<Flight> getAllFlight(){
        return (List<Flight>) flightRepository.findAll();
    }

    public Flight getFlightById(int id){
        return flightRepository.findByFlightId(id);
    }

    public List<Flight> getAllFlightRecommend(){
        return flightRepository.findByFlightRouteOriginAirportCityCityNameAndEconomyPriceLessThan("Da Nang",101.0);
    }

    public boolean deleteFLight (int id){
//        Flight flight = flightRepository.findByFlightId(id);
//        if (flight.getFlightStatus().equals("On time")) return false;
        try{
            if(flightRepository.findByFlightId(id).getFlightStatus().equals("On time"))return false;
            ticketService.deleteByFlightId(id);
            flightRepository.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public boolean saveFlight(Flight flight){
        try{
            flightRepository.save(flight);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public boolean isException(Flight flight){
        boolean ex = false;
        // check time input
        if(flight.getDepartureTime().isAfter(flight.getArrivalTime())||flight.getDepartureTime().isEqual(flight.getArrivalTime())) ex = true;
        // check data existed
        if(flightRepository.findByFlightId(flight.getFlightId())==null){
            if (flightRepository.existsByDepartureTimeAndArrivalTimeAndFlightRouteAndAircraft(flight.getDepartureTime()
                    ,flight.getArrivalTime(),flight.getFlightRoute(),flight.getAircraft())) ex = true;
            List<Flight> flightList1 = flightRepository.findByFlightRouteAndAircraft(flight.getFlightRoute(),flight.getAircraft());
            LocalDateTime departure_time = flight.getDepartureTime();
            LocalDateTime arrival_time = flight.getDepartureTime();
            for(Flight f : flightList1){
                if (departure_time.isAfter(f.getDepartureTime())&&departure_time.isBefore(f.getArrivalTime())) ex = true;
                if (arrival_time.isAfter(f.getDepartureTime())&&arrival_time.isBefore(f.getArrivalTime())) ex = true;
            }
        }
        if (flightRepository.findByFlightId(flight.getFlightId())!=null){
            List<Flight> flightList1 = flightRepository.findByFlightRouteAndAircraft(flight.getFlightRoute(),flight.getAircraft());
            LocalDateTime departure_time = flight.getDepartureTime();
            LocalDateTime arrival_time = flight.getDepartureTime();
            for(Flight f : flightList1){
                if (departure_time.isAfter(f.getDepartureTime())&&departure_time.isBefore(f.getArrivalTime())) ex = true;
                if (arrival_time.isAfter(f.getDepartureTime())&&arrival_time.isBefore(f.getArrivalTime())) ex = true;
            }
        }
        return ex;
    }

}
