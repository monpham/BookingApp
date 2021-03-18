package com.example.demo.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Entity
@Table(name = "flight")
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "flight_id")
    private int flightId;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @Column(name = "departure_time")
    private LocalDateTime departureTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    @Column(name = "arrival_time")
    private LocalDateTime arrivalTime;
    @Column(name = "flight_status")
    private String flightStatus;
    @Column(name = "economyPrice")
    private double economyPrice;
    @Column(name = "businessPrice")
    private double businessPrice;
    @Transient
    private String _departureTime;
    @Transient
    private String _arrivalTime;
    @ManyToOne
    @JoinColumn(name = "aircraft_id")
    private Aircraft aircraft;
    @ManyToOne
    @JoinColumn(name = "route_id")
    private FlightRoute flightRoute;
    @OneToMany(mappedBy = "flight", fetch = FetchType.LAZY)
    private List<Ticket> ticketList;

    public double getEconomyPrice() {
        return economyPrice;
    }

    public void setEconomyPrice(double economyPrice) {
        this.economyPrice = economyPrice;
    }

    public double getBusinessPrice() {
        return businessPrice;
    }

    public void setBusinessPrice(double businessPrice) {
        this.businessPrice = businessPrice;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public LocalDateTime getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(LocalDateTime departureTime) {
        this.departureTime = departureTime;
    }

    public LocalDateTime getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(LocalDateTime arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getFlightStatus() {
        return flightStatus;
    }

    public void setFlightStatus(String flightStatus) {
        this.flightStatus = flightStatus;
    }

    public Aircraft getAircraft() {
        return aircraft;
    }

    public void setAircraft(Aircraft aircraft) {
        this.aircraft = aircraft;
    }

    public FlightRoute getFlightRoute() {
        return flightRoute;
    }

    public void setFlightRoute(FlightRoute flightRoute) {
        this.flightRoute = flightRoute;
    }

    public List<Ticket> getTicketList() {
        return ticketList;
    }

    public void setTicketList(List<Ticket> ticketList) {
        this.ticketList = ticketList;
    }

    public String get_departureTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
        return this.getDepartureTime().format(formatter);
    }

    public String get_arrivalTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
        return this.getArrivalTime().format(formatter);
    }

    public Flight() {
    }
}
