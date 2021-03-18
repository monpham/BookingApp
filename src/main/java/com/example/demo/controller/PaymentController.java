package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.helper.EmailService;
import com.example.demo.object.*;

import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/")
public class PaymentController {
    @Autowired
    private CreditCardService creditCardService;

    @Autowired
    private FlightService flightService;

    @Autowired
    private TicketService ticketService;

    @Autowired
    private PassengerService passengerService;

    @Autowired
    private GuestService guestService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private TicketTypeService ticketTypeService;

    @Autowired
    private TravelClassService travelClassService;

    @Autowired
    private EmailService emailService;

    // Payment Method
    @RequestMapping(value = "/paymentMethod", method = RequestMethod.GET)
    public String goToPaymentMethod(Model model, HttpServletRequest request, HttpSession session) {
        model.addAttribute("sessionId", request.getSession().getId());
        System.out.println(request.getSession().getId());
        FlightPicker flightPicker = (FlightPicker) session.getAttribute(request.getSession().getId());
        System.out.println(flightPicker.getDepartureTrip().getTravelClass());
        if (flightPicker != null) {
            System.out.println("Say hi!!!: " + flightPicker.getTicketInformation().getTripType());
            List<PaymentInformation> paymentInformationList = new ArrayList<>();

            Flight departureFlight = flightService.getFlightById(flightPicker.getDepartureTrip().getDepartureFlightId());
            Flight returnFlight = flightService.getFlightById(flightPicker.getReturnTrip().getReturnFlightId());

            //Add passenger information for departure trip
            List<PassengerInformation> passengerInformationList = flightPicker.getPassengerInformation();
            if (!passengerInformationList.isEmpty()) {
                for (PassengerInformation p : passengerInformationList) {
                    String passengerName = p.getFirstName() + " " + p.getLastName();
                    System.out.println(passengerName);
                    List<SeatPossession> departureSeatPossessions = flightPicker.getDepartureTrip().getDepartureSeatPossessions();
                    if (departureSeatPossessions != null) {
                        for (SeatPossession s : departureSeatPossessions) {
                            if (s.getPassengerName().equals(passengerName)) {
                                String seatCode = s.getSeatCode();
                                seatCode = seatCode.substring(seatCode.lastIndexOf("-") + 1, seatCode.length());
                                paymentInformationList.add(new PaymentInformation(departureFlight, p, flightPicker.getDepartureTrip().getTravelClass(), ticketService.getTicketByFlightIdAndSeatCodeAndTravelClass(departureFlight.getFlightId(), seatCode, travelClassService.getTravelClassByClassName(flightPicker.getDepartureTrip().getTravelClass()))));
                            }
                        }
                    }

                }

                //Add passenger information for return trip
                for (PassengerInformation p : passengerInformationList) {
                    String passengerName = p.getFirstName() + " " + p.getLastName();
                    System.out.println(passengerName);
                    List<SeatPossession> returnSeatPossessions = flightPicker.getReturnTrip().getReturnSeatPossessions();
                    if (returnSeatPossessions != null) {
                        for (SeatPossession s : returnSeatPossessions) {
                            if (s.getPassengerName().equals(passengerName)) {
                                String seatCode = s.getSeatCode();
                                seatCode = seatCode.substring(seatCode.lastIndexOf("-") + 1, seatCode.length());
                                paymentInformationList.add(new PaymentInformation(returnFlight, p, flightPicker.getDepartureTrip().getTravelClass(), ticketService.getTicketByFlightIdAndSeatCodeAndTravelClass(returnFlight.getFlightId(), seatCode, travelClassService.getTravelClassByClassName(flightPicker.getReturnTrip().getTravelClass()))));
                            }
                        }
                    }
                }
            }

            session.setAttribute(request.getSession().getId() + request.getSession().getId(), paymentInformationList);
            model.addAttribute("paymentInformationList", paymentInformationList);
        }

        return "payment-method";
    }

    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public String goToPaymentPage(Model model, HttpSession session, HttpServletRequest request) {
        System.out.println(request.getSession().getId());
        model.addAttribute("creditCard", new CreditCard());
        FlightPicker flightPicker = (FlightPicker) session.getAttribute(request.getSession().getId());
        if (flightPicker != null) {
            model.addAttribute("totalPrice", flightPicker.getTotalPaymentAmount());
        }
        System.out.println("I have gone through Payment...");
        return "payment";
    }

    @Transactional
    @RequestMapping(value = "/payment", method = RequestMethod.POST)
    public String handlePayment(@ModelAttribute CreditCard creditCard, Model model, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        System.out.println(request.getSession().getId());
        FlightPicker flightPicker = (FlightPicker) session.getAttribute(request.getSession().getId());

        double totalAmount = 0;
        if (flightPicker != null) {
            totalAmount = flightPicker.getTotalPaymentAmount();
        }

        if (creditCard != null) {
            CreditCard creditCardReceived = creditCardService.getCreditCardByCardNumber(creditCard.getCardNumber());
            if (creditCardReceived == null) {
                model.addAttribute("creditCard", creditCard);
                model.addAttribute("message", "This credit card does not exist...");
                return "payment";
            } else {
                //Check card number and password (otp)

                if ((creditCardReceived.getCardNumber().equals(creditCard.getCardNumber())) && (creditCardReceived.getOTP().equals(creditCard.getOTP()))) {
                    if ((creditCardReceived.getBalance() - totalAmount) >= 0) {
                        model.addAttribute("message", "Booking Successfully");
                        ////////////////////Do a tons of things here to save the booking data
                        try {
                            System.out.println("Say hi ??");
                            creditCardReceived.setBalance(creditCardReceived.getBalance() - totalAmount);
                            creditCardService.saveCreditCardData(creditCardReceived);
                            List<Guest> guests = guestService.getAllGuestsByFirstNameAndLastNameAndPhoneNumberAndEmail(flightPicker.getContactInformation().getFirstName(), flightPicker.getContactInformation().getLastName(), flightPicker.getContactInformation().getPhoneNumber(), flightPicker.getContactInformation().getEmail());

                            if (guests.isEmpty()) {
                                guestService.saveNewGuestData(new Guest(flightPicker.getContactInformation().getFirstName(), flightPicker.getContactInformation().getLastName(), flightPicker.getContactInformation().getPhoneNumber(), flightPicker.getContactInformation().getEmail()));
                            }
                            Guest guest = guestService.getGuestDataByByFirstNameAndLastNameAndPhoneNumberAndEmail(flightPicker.getContactInformation().getFirstName(), flightPicker.getContactInformation().getLastName(), flightPicker.getContactInformation().getPhoneNumber(), flightPicker.getContactInformation().getEmail());

                            //Payment session will last only 10 minutes !!! --> have not configured , it will be okay though baby
                            String sessionCreated = request.getSession().getId() + LocalDateTime.now().toString();
                            paymentService.saveNewPayment(new Payment("credit", true, sessionCreated, LocalDate.now(),totalAmount, creditCardReceived));
                            Payment payment = paymentService.getPaymentBySessionId(sessionCreated);

                            //Save booking data to DB
                            bookingService.saveNewBookingData(new Booking(guest, payment));
                            Booking booking = bookingService.getBookingByPayment(payment);
                            Flight departureFlight = flightService.getFlightById(flightPicker.getDepartureTrip().getDepartureFlightId());

                            //Save passengers' data to DB
                            List<PassengerInformation> passengerInformationList = flightPicker.getPassengerInformation();
                            if (passengerInformationList != null) {
                                //Make sure every passenger information saved in DB
                                for (PassengerInformation p : passengerInformationList) {
                                    Passenger passenger = passengerService.getPassengerByPassportId(p.getPassportNumber());
                                    passengerService.saveNewPassenger(new Passenger(p.getTitle(), p.getFirstName(), p.getLastName(), p.getGender(), p.getDateOfBirth(), p.getEmail(), p.getPhoneNumber(), p.getPassportNumber()));
                                }
                                /////

                                //Ticket Information
                                for (PassengerInformation p : passengerInformationList)
                                {
                                    if (!(p.getTitle().equals("infant"))) {
                                        //try catch at this point
                                        Passenger passenger = new Passenger();
                                        if (!(p.getTitle().equals("infant"))){
                                            passenger = passengerService.getPassengerByPassportId(p.getPassportNumber());

                                        }
                                        String fullName = passenger.getFirstName() + " " + passenger.getLastName();
                                        List<SeatPossession> departureSeatPossessions = flightPicker.getDepartureTrip().getDepartureSeatPossessions();
                                        if (departureSeatPossessions != null) {
                                            for (SeatPossession s : departureSeatPossessions) {
                                                if (fullName.equals(s.getPassengerName())) {
                                                    String seatCode = s.getSeatCode();
                                                    seatCode = seatCode.substring(seatCode.lastIndexOf("-") + 1, seatCode.length());
                                                    System.out.println(seatCode);
                                                    System.out.println(flightPicker.getDepartureTrip().getTravelClass() + "Error happened here !!!");
                                                    Ticket ticket = ticketService.getTicketByFlightIdAndSeatCodeAndTravelClass(departureFlight.getFlightId(), seatCode, travelClassService.getTravelClassByClassName(flightPicker.getDepartureTrip().getTravelClass()));

                                                    double departureTicketPrice = 0;
                                                    ticket.setTicketType(ticketTypeService.getTicketTypeByTicketTypeName(passenger.getTitle()));
                                                    if (flightPicker.getDepartureTrip().getTravelClass().equals("business")) {
                                                        departureTicketPrice = ticket.getTicketType().getRate() * departureFlight.getBusinessPrice();
                                                    } else {
                                                        departureTicketPrice = ticket.getTicketType().getRate() * departureFlight.getEconomyPrice();
                                                    }
                                                    //based on this constructor --> (int ticketId, String seatCode, boolean enabled, Flight flight, Booking booking, Passenger passenger, double price, TicketType ticketType, TravelClass travelClass)

                                                    /*ticketService.updateTicketInformation(new Ticket(ticket.getTicketId(), ticket.getSeatCode(), false, ticket.getFlight(), booking, passenger, departureTicketPrice, ticket.getTicketType(), travelClassService.getTravelClassByClassName(flightPicker.getDepartureTrip().getTravelClass())));*/
                                                    ticket.setEnabled(false);
                                                    ticket.setBooking(booking);
                                                    ticket.setPassenger(passenger);
                                                    ticket.setPrice(departureTicketPrice);

                                                    ticketService.updateTicketInformation(ticket);
                                                }
                                            }
                                        }
                                        ///////

                                        if (flightPicker.getTicketInformation().getTripType().equals("roundTrip")) {
                                            Flight returnFlight = flightService.getFlightById(flightPicker.getReturnTrip().getReturnFlightId());

                                            List<SeatPossession> returnSeatPossessions = flightPicker.getReturnTrip().getReturnSeatPossessions();
                                            if (returnSeatPossessions != null) {
                                                for (SeatPossession rs : returnSeatPossessions) {
                                                    if (fullName.equals(rs.getPassengerName())) {
                                                        String seatCode = rs.getSeatCode();
                                                        seatCode = seatCode.substring(seatCode.lastIndexOf("-") + 1, seatCode.length());
                                                        System.out.println(seatCode);
                                                        Ticket ticket = ticketService.getTicketByFlightIdAndSeatCodeAndTravelClass(returnFlight.getFlightId(), seatCode, travelClassService.getTravelClassByClassName(flightPicker.getReturnTrip().getTravelClass()));

                                                        double returnTicketPrice = 0;
                                                        ticket.setTicketType(ticketTypeService.getTicketTypeByTicketTypeName(passenger.getTitle()));
                                                        if (flightPicker.getReturnTrip().getTravelClass().equals("business")) {
                                                            returnTicketPrice = ticket.getTicketType().getRate() * returnFlight.getBusinessPrice();
                                                        } else {
                                                            returnTicketPrice = ticket.getTicketType().getRate() * returnFlight.getEconomyPrice();
                                                        }

                                                        /*ticketService.updateTicketInformation(new Ticket(ticket.getTicketId(), ticket.getSeatCode(), false, ticket.getFlight(), booking, passenger, returnTicketPrice, ticket.getTicketType(), travelClassService.getTravelClassByClassName(flightPicker.getDepartureTrip().getTravelClass())));*/
                                                        //Update ticket information
                                                        ticket.setEnabled(false);
                                                        ticket.setBooking(booking);
                                                        ticket.setPassenger(passenger);
                                                        ticket.setPrice(returnTicketPrice);

                                                        ticketService.updateTicketInformation(ticket);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                model.addAttribute("bookingId",booking.getBookingId());
                                model.addAttribute("lastName", booking.getGuest().getLastName());
                                emailService.sendMail(flightPicker.getContactInformation().getEmail(), "Booking Details: " + booking.getBookingId(), "To see the details of your booking, click the link here  <a href='http://localhost:8080/bookingDetails?booking.bookingId=" + booking.getBookingId() + "&passenger.lastName=" + flightPicker.getContactInformation().getLastName() + "'>" + "here" + "</a>" );

                                List<PassengerInformation> passengerInformationListForEmails = flightPicker.getPassengerInformation();
                                if (!passengerInformationListForEmails.isEmpty()) {
                                    for (PassengerInformation p : passengerInformationListForEmails) {
                                        if (p.getEmail() != null) {
                                            emailService.sendMail(p.getEmail(), "Booking Details: " + booking.getBookingId(), "To see the details of your booking, click the link here  <a href='http://localhost:8080/bookingDetails?booking.bookingId=" + booking.getBookingId() + "'>" + "here" + "</a>" );
                                        }
                                    }
                                }
                            }
                        } catch (Exception e)
                        {
                            e.printStackTrace();

                            model.addAttribute("message", "Your Information filled in previously has something wrong...");
                            return "redirect:/payment";
                        }
                            return "payment-receipt";
                    } else
                    {
                        model.addAttribute("creditCard", creditCard);
                        model.addAttribute("message", "Fail to pay for the ticket's prices --> your balance is not enough!!!");
                        return "redirect:/payment";
                    }
                    /////////////////////////////////////////////////////
                } else
                {
                    model.addAttribute("creditCard", creditCard);
                    model.addAttribute("message", "Please check your otp again...");
                    return "redirect:/payment";
                }
            }
        }
        System.out.println("Opp, you should check your credit card again");
        return "redirect:/payment";
    }


}


