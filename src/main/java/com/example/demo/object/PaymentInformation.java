package com.example.demo.object;

import com.example.demo.entity.Flight;
import com.example.demo.entity.Ticket;

import java.time.LocalDate;

public class PaymentInformation {
    private Flight flight;
    private PassengerInformation passengerInformation;
    private String travelClass;
    private Ticket ticket;

    public PaymentInformation() {
    }

    public PaymentInformation(Flight flight, PassengerInformation passengerInformation, String travelClass, Ticket ticket) {
        this.flight = flight;
        this.passengerInformation = passengerInformation;
        this.travelClass = travelClass;
        this.ticket = ticket;
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }

    public PassengerInformation getPassengerInformation() {
        return passengerInformation;
    }

    public void setPassengerInformation(PassengerInformation passengerInformation) {
        this.passengerInformation = passengerInformation;
    }

    public String getTravelClass() {
        return travelClass;
    }

    public void setTravelClass(String travelClass) {
        this.travelClass = travelClass;
    }
}
