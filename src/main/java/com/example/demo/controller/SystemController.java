package com.example.demo.controller;

import com.example.demo.entity.Ticket;
import com.example.demo.object.FlightPicker;
import com.example.demo.object.PassengerInformation;
import com.example.demo.object.TicketInformation;
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping(value = "/")
public class SystemController {
    @Autowired
    private FlightService flightService;
    @Autowired
    private PromotionService promotionService;
    @Autowired
    private AircraftService aircraftService;
    @Autowired
    private TicketService ticketService;

    @Autowired
    private CountryService countryService;

    @Autowired
    private AirportService airportService;

    @RequestMapping(value = "/promo")
    public String goToPromopage(Model model) {
        model.addAttribute("promotionList",promotionService.getAllPromotions());
        return "promo";
    }
    @RequestMapping(value = "/promo_details")
    public String goToPromoDetailspage(@RequestParam("id")int id, Model model) {
        model.addAttribute("promotion",promotionService.getPromotionById(id));
        return "promo_details";
    }


    @RequestMapping(value = "/")
    public String goToHomepage(Model model, HttpServletRequest request) {
        //This guy is used for ticket search engine
        model.addAttribute("sessionId", request.getSession().getId());
        System.out.println(request.getSession().getId());
        model.addAttribute("ticketInformation", new TicketInformation());
        model.addAttribute("aircraftList",aircraftService.getAllAircraft());
        model.addAttribute("flightListRecommend", flightService.getAllFlightRecommend());
        /*----*/
        return "index";
    }

    //////////////////////////////
    // a function to looking for a flight / ticket !!!
    /*@RequestMapping(value = "/ticketSearch")
    public String goToTicketSearch(Model model, HttpServletRequest request) {
        model.addAttribute("sessionId", request.getSession().getId());
        System.out.println(request.getSession().getId());
        model.addAttribute("ticketInformation", new TicketInformation());
        return "ticket-searching-test";
    }*/

    // Return Ticket Searched's Results
    @RequestMapping(value = "/ticketSearch", method = RequestMethod.POST)
    public String goToTicketList(@ModelAttribute("ticketForm") TicketInformation t, Model model, HttpServletRequest request) {
        model.addAttribute("sessionId", request.getSession().getId());
        /*int numberOfPeople = t.getPassengerType().getNumberOfAdults() + t.getPassengerType().getNumberOfChildren() + t.getPassengerType().getNumberOfInfant();*/
        /*int numberOfPeople = t.getAdults() + t.getChildren() + t.getInfant();*/
        int numberOfPeople = t.getAdults() + t.getChildren();
        /////////////
        // Departure Time
        LocalDateTime initialTimeOfDepartureDate = t.getDepartureDate().atStartOfDay();
        LocalDateTime endTimeOfDepartureDate = t.getDepartureDate().atTime(23, 59);

        model.addAttribute("sessionId", request.getSession().getId());
        //Format!!!
        /*System.out.println(initialTimeOfDepartureDate);*/
        model.addAttribute("ticketInformation", t);


        if (t.getTravelClass().equals("all")) {
            /*model.addAttribute("departFlights", flightService.getAllOneWayFlightsBySearchConditions(t.getOrigin(), t.getDestination(), initialTimeOfDepartureDate, endTimeOfDepartureDate, numberOfPeople));*/
            model.addAttribute("departFlights", flightService.getAllOneWayFlightsBySearchConditions(airportService.getAirportByCityName(t.getOrigin()).getAirportName(), airportService.getAirportByCityName(t.getDestination()).getAirportName(), initialTimeOfDepartureDate, endTimeOfDepartureDate, numberOfPeople));
        } else {
            /*model.addAttribute("departFlights", flightService.getAllOneWayFlightsBySearchConditionsWithTravelClass(t.getOrigin(), t.getDestination(), initialTimeOfDepartureDate, endTimeOfDepartureDate, numberOfPeople, t.getTravelClass()));*/
            model.addAttribute("departFlights", flightService.getAllOneWayFlightsBySearchConditionsWithTravelClass(airportService.getAirportByCityName(t.getOrigin()).getAirportName(), airportService.getAirportByCityName(t.getDestination()).getAirportName(), initialTimeOfDepartureDate, endTimeOfDepartureDate, numberOfPeople, t.getTravelClass()));
        }
            /*model.addAttribute("departFlights", flightService.getAllOneWayFlightsBySearchConditions(t.getOrigin(), t.getDestination(), initialTimeOfDepartureDate, endTimeOfDepartureDate, numberOfPeople));*/
         if (t.getTripType().equals("roundTrip")) {
            //This is an easy way to show data --> upgrade later!!!
            LocalDateTime initialTimeOfReturnDate = t.getReturnDate().atStartOfDay();
            LocalDateTime endTimeOfReturnDate = t.getReturnDate().atTime(23, 59);

             if (t.getTravelClass().equals("all")) {
                 /*model.addAttribute("returnFlights", flightService.getAllOneWayFlightsBySearchConditions(t.getDestination(), t.getOrigin(), initialTimeOfReturnDate, endTimeOfReturnDate, numberOfPeople));*/
                 model.addAttribute("returnFlights", flightService.getAllOneWayFlightsBySearchConditions(airportService.getAirportByCityName(t.getDestination()).getAirportName(), airportService.getAirportByCityName(t.getOrigin()).getAirportName(), initialTimeOfReturnDate, endTimeOfReturnDate, numberOfPeople));
             } else {
                 /*model.addAttribute("returnFlights", flightService.getAllOneWayFlightsBySearchConditionsWithTravelClass(t.getDestination(), t.getOrigin(), initialTimeOfReturnDate, endTimeOfReturnDate, numberOfPeople, t.getTravelClass()));*/
                 model.addAttribute("returnFlights", flightService.getAllOneWayFlightsBySearchConditionsWithTravelClass(airportService.getAirportByCityName(t.getDestination()).getAirportName(), airportService.getAirportByCityName(t.getOrigin()).getAirportName(), initialTimeOfReturnDate, endTimeOfReturnDate, numberOfPeople, t.getTravelClass()));
             }

            //Display table return flights!!!
            model.addAttribute("returnStatus", "true");
        }
         /*return "ticket-list-model";*/
            return "ticket-list";
    }

    //////////////////////////////
    // Passengers' information
    @RequestMapping(value = "/passengerDetails", method = RequestMethod.GET)
    public String getPassengerDetails(Model model, HttpServletRequest request, HttpSession session) {
//        FlightPicker flightPicker = webAPI.getFlightsPicked();
        /*System.out.println(flightPicker.getDepartureTrip().getTravelClass());*/
        model.addAttribute("sessionId", request.getSession().getId());
        FlightPicker flightPicker = (FlightPicker) session.getAttribute(session.getId());
        System.out.println("Hello: " + flightPicker.getDepartureTrip().getTravelClass());
        int adults, infants, children;
        adults = flightPicker.getDepartureTrip().getAdults();
        infants = flightPicker.getDepartureTrip().getInfant();
        children = flightPicker.getDepartureTrip().getChildren();
        System.out.println("Adult, Children, Infants: " + adults + children + infants);

        //Handle Form -->
        List<PassengerInformation> passengerList = new ArrayList<>();

        for (int i = 1; i <= (adults + children + infants); i++) {
            PassengerInformation passengerInformation = new PassengerInformation();
            if (i <= adults) {
                passengerInformation.setTitle("adult");
            } else if (i <= (adults + children)) {
                passengerInformation.setTitle("child");
            } else {
                passengerInformation.setTitle("infant");
            }
            passengerList.add(passengerInformation);
        }

        model.addAttribute("passengerList", passengerList);
        model.addAttribute("flightPicker", flightPicker);

        model.addAttribute("countryNames", countryService.getAllCountriesName());
        /*model.addAttribute("passenger", new PassengerInformation());*/
        /*return "passenger-details";*/
        return "passenger-details";
    }

    //Seat Selection Function while booking flight ticket!!!
    @RequestMapping(value = "/seatSelection", method = RequestMethod.GET)
    public String goToSeatSelection(Model model, HttpServletRequest request, HttpSession session) {
        model.addAttribute("sessionId", request.getSession().getId());
        System.out.println(request.getSession().getId());

        FlightPicker flightPicker = (FlightPicker) session.getAttribute(request.getSession().getId());

        //my edit
        model.addAttribute("flightDeparture", flightService.getFlightById(flightPicker.getDepartureTrip().getDepartureFlightId()));
        model.addAttribute("flightReturn", flightService.getFlightById(flightPicker.getReturnTrip().getReturnFlightId()));
        //end
        model.addAttribute("flightPicker", flightPicker);
        String tripType = "";

        // get the initial values
        if (flightPicker != null) {
            //Print out to test if this is either null or not...
            System.out.println(flightPicker.getDepartureTrip().getDepartureFlightId());

            //New Edit
            List<String> passengerNames = new ArrayList<>();
            for (PassengerInformation p: flightPicker.getPassengerInformation()){
                if (!(p.getTitle().equals("infant"))) {
                    passengerNames.add(p.getFirstName() + " " + p.getLastName());
                    System.out.println(p.getFirstName() + " " + p.getLastName());
                }
            }
            model.addAttribute("passengerNames", passengerNames);

            tripType = flightPicker.getTicketInformation().getTripType();
            System.out.println(tripType);
        } else {
            System.out.println("FLight Picker is null!!!");
        }
        System.out.println("Reach the final line of codes in this request!!!");
        return "seat-selection";
    }


    /*http://localhost:8080/bookingDetails?booking.bookingId=14&passenger.lastName=kai*/
    @RequestMapping(value = "/bookingDetails", method = RequestMethod.GET)
    public String goToBookingDetails (Ticket ticket, Model model) {
        System.out.println(ticket.getPassenger().getLastName());
        System.out.println(ticket.getBooking().getBookingId());
        List<Ticket> tickets = ticketService.getTicketsByBookingIdAndLowercaseLastName(ticket.getBooking().getBookingId(), ticket.getPassenger().getLastName());
        if (tickets.isEmpty()) {
            tickets = ticketService.getTicketsByBookingId(ticket.getBooking().getBookingId());
        }
        System.out.println(ticket.getPassenger().getLastName().toLowerCase());
        model.addAttribute("tickets", tickets);
        return "booking-search";
    }

    @RequestMapping(value = "/bookingSearch", method = RequestMethod.GET)
    public String goToBookingSearch (Model model) {
        model.addAttribute("ticket", new Ticket());
        return "booking-search";
    }
    //For Date Time formatter
    @InitBinder
    private void dateBinder(WebDataBinder binder) {
        //The date format to parse or output your dates
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        //Create a new CustomDateEditor
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);

        //Register it as custom editor for the Date type
        binder.registerCustomEditor(Date.class, editor);

    }


}
