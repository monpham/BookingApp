package com.example.demo.restAPI;

import com.example.demo.entity.Airport;
import com.example.demo.entity.Flight;
import com.example.demo.entity.Ticket;
import com.example.demo.object.FlightPicker;
import com.example.demo.object.PaymentInformation;
import com.example.demo.object.SeatPossession;
import com.example.demo.service.AirportService;
import com.example.demo.service.FlightRouteService;
import com.example.demo.service.FlightService;
import com.example.demo.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/")
public class WebAPI {
    @Autowired
    private FlightRouteService flightRouteService;

    @Autowired
    private FlightService flightService;

    @Autowired
    private AirportService airportService;

    @Autowired
    private TicketService ticketService;

    @RequestMapping(value = "/originWithCityName", method = RequestMethod.GET)
    public Object getOriginsWithCityName () {
        List<String> cityNames = new ArrayList<>();
        for (Airport a : airportService.getAllAirports()) {
            cityNames.add(a.getCity().getCityName());
        }
        return cityNames;
    }

    @RequestMapping(value = "destinationWithCityName/{origin}", method = RequestMethod.GET)
    public Object getDestinationWithCityName (@PathVariable("origin") String originWithCityName) {
        List<String> destinationCityNames = new ArrayList<>();
        destinationCityNames = flightRouteService.getAllDestinationCityNamesWithOriginCityName(originWithCityName);
        return destinationCityNames;
    }



    @RequestMapping(value = "/origin", method = RequestMethod.GET)
    public Object getOrigins() {
        List<String> airports = new ArrayList<>();
        for (Airport a : airportService.getAllAirports()) {
            airports.add(a.getAirportName());
        }
        return airports;
    }

    @GetMapping("/destination/{origin}")
    public Object getDestinationCorrespondingOrigin(@PathVariable(value = "origin") String origin) {
        return flightRouteService.getAllDestinationsNameByOriginName(origin);
    }

    @RequestMapping(value = "/flightPickerHandler", method = RequestMethod.POST, produces = "application/json")
    public FlightPicker getFlightsPicked(@RequestBody FlightPicker flightPicker, HttpSession session) {
        System.out.println("Here i go flight picker handler...");
        System.out.println(session.getId());
        System.out.println(flightPicker.getDepartureTrip().getTravelClass());
        System.out.println(flightPicker.getReturnTrip().getTravelClass());
        session.setAttribute(session.getId(), flightPicker);
        return flightPicker;
    }

    @RequestMapping(value = "/seatStatus/{flightId}/{travelClass}", method = RequestMethod.GET)
    public Object getSeatStatus (@PathVariable("flightId") int flightId, @PathVariable("travelClass") String travelClass) {
        List<Ticket> tickets = ticketService.getTicketsByFlightIdAndTravelClass(flightId, travelClass);
        Map<String, Boolean> ticketStatus = new HashMap<>();
        for (Ticket t: tickets) {
            ticketStatus.put(t.getSeatCode(), t.isEnabled());
        }
        return ticketStatus;
    }

}
