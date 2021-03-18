package com.example.demo.service;

import com.example.demo.entity.*;
import com.example.demo.object.TicketInformation;
import com.example.demo.repository.TicketRepository;
import com.example.demo.repository.TravelClassRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TicketService {
    @Autowired
    private TicketRepository ticketRepository;
    @Autowired
    private TravelClassRepository travelClassRepository;

    public List<Ticket> getTicketsByBookingId (int bookingId) {
        return ticketRepository.findByBookingBookingId(bookingId);
    }
    public boolean resetTicketValuesByBookingId (int bookingId) {
        try {
            List<Ticket> tickets = ticketRepository.findByBookingBookingId(bookingId);
            for (Ticket t: tickets) {
                t.setEnabled(true);
                t.setBooking(null);
                t.setPassenger(null);
                t.setPrice(0.0);
                ticketRepository.save(t);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Ticket> getTicketsByBookingIdAndLowercaseLastName (int bookingId, String lastName) {
        return ticketRepository.findByBookingIdAndLowercaseLastName(bookingId, lastName);
    }
    public List<Ticket> getTicketsByFlightIdAndTravelClass(int flightId, String travelClass) {
        return ticketRepository.findByFlightFlightIdAndTravelClassClassName(flightId, travelClass);
    }


    // Tickets are automatically generated when flight is created --> who books tickets is filled in the ticket with their information
    public void updateTicketInformation (Ticket ticket) {
        ticketRepository.save(ticket);
    }

    public Ticket getTicketByFlightIdAndSeatCodeAndTravelClass (int flightId, String seatCode, TravelClass travelClass) {
        return ticketRepository.findByFlightFlightIdAndSeatCodeAndAndTravelClass(flightId, seatCode, travelClass);
    }

    public Ticket getTicketByFlightIdAndSeatCode (int flightId, String seatCode) {
        return ticketRepository.findByFlightFlightIdAndSeatCode(flightId, seatCode);
    }
    // Create ticket
    private void setTicket(Flight var1, boolean var2, TravelClass var3, String var4){
        Ticket ticket = new Ticket(var4,var2,var1,var3);
        ticketRepository.save(ticket);
    }
    public boolean deleteByFlightId(int id){
        try{
            List<Ticket> tickets = ticketRepository.findByFlight_FlightId(id);
            for(Ticket ticket : tickets){
                ticketRepository.deleteById(ticket.getTicketId());
            }
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public void createTickets(Flight flight){
        int total_economy = flight.getAircraft().getTotal_economy();
        int total_business = flight.getAircraft().getTotal_business();
        int a = 1;
        int b = 1;
        while(true){
            if (a>total_economy) break;
            for (int i = 1; i<=6; i++){
                int vtr = (a%6==0) ? a/6 : a/6+1 ;
                if(a>total_economy) break;
                switch (i){
                    case 1:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(1),"A"+vtr);
                        a++;
                        break;
                    case 2:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(1),"B"+vtr);
                        a++;
                        break;
                    case 3:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(1),"C"+vtr);
                        a++;
                        break;
                    case 4:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(1),"D"+vtr);
                        a++;
                        break;
                    case 5:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(1),"E"+vtr);
                        a++;
                        break;
                    case 6:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(1),"F"+vtr);
                        a++;
                        break;
                }
            }
        }
        while(true){
            if (b>total_business) break;
            for (int i = 1; i<=6; i++){
                int vtr = (b%6==0) ? b/6 : b/6+1 ;
                if(b>total_business) break;
                switch (i){
                    case 1:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(2),"A"+vtr);
                        b++;
                        break;
                    case 2:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(2),"B"+vtr);
                        b++;
                        break;
                    case 3:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(2),"C"+vtr);
                        b++;
                        break;
                    case 4:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(2),"D"+vtr);
                        b++;
                        break;
                    case 5:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(2),"E"+vtr);
                        b++;
                        break;
                    case 6:
                        setTicket(flight,true,travelClassRepository.findByTravelClassId(2),"F"+vtr);
                        b++;
                        break;
                }
            }
        }
    }
}
