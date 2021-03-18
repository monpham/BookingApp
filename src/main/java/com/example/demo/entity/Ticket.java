package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "ticket")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ticket_id")
    private int ticketId;

    @Column(name = "seat_code")
    private String seatCode;

    @Column(name = "enabled")
    private boolean enabled;

    @ManyToOne
    @JoinColumn(name = "flight_id")
    private Flight flight;

    @ManyToOne
    @JoinColumn(name = "booking_id")
    private Booking booking;

    @ManyToOne
    @JoinColumn(name = "passenger_id")
    private Passenger passenger;

    @Column(name = "price")
    private double price;

    @ManyToOne
    @JoinColumn(name = "ticket_type_id")
    private TicketType ticketType;

    @ManyToOne
    @JoinColumn(name = "travel_class")
    private TravelClass travelClass;

    public Ticket() {
    }
    public Ticket(String seatCode, boolean enabled, Flight flight, TravelClass travelClass) {
        this.seatCode = seatCode;
        this.enabled = enabled;
        this.flight = flight;
        this.travelClass = travelClass;
    }

    public Ticket(int ticketId, String seatCode, boolean enabled, Flight flight, Booking booking, Passenger passenger, double price, TicketType ticketType, TravelClass travelClass) {
        this.ticketId = ticketId;
        this.seatCode = seatCode;
        this.enabled = enabled;
        this.flight = flight;
        this.booking = booking;
        this.passenger = passenger;
        this.price = price;
        this.ticketType = ticketType;
        this.travelClass = travelClass;
    }

    public String getSeatCode() {
        return seatCode;
    }

    public void setSeatCode(String seatCode) {
        this.seatCode = seatCode;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }



    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    public Passenger getPassenger() {
        return passenger;
    }

    public void setPassenger(Passenger passenger) {
        this.passenger = passenger;
    }

    public TicketType getTicketType() {
        return ticketType;
    }

    public void setTicketType(TicketType ticketType) {
        this.ticketType = ticketType;
    }

    public TravelClass getTravelClass() {
        return travelClass;
    }

    public void setTravelClass(TravelClass travelClass) {
        this.travelClass = travelClass;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
