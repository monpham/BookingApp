//package com.example.demo.entity;
//
//import javax.persistence.*;
//
//@Entity
//@Table(name = "seat")
//public class Seat {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "seat_id")
//    private int seatId;
//    @Column(name = "seat_code")
//    private String seatCode;
//    @ManyToOne
//    @JoinColumn(name = "aircraft_id")
//    private Aircraft aircraft;
//    @ManyToOne
//    @JoinColumn(name = "class_id")
//    private TravelClass travelClass;
//    @OneToOne(mappedBy = "seat")
//    private Ticket ticket;
//
//    public int getSeatId() {
//        return seatId;
//    }
//
//    public void setSeatId(int seatId) {
//        this.seatId = seatId;
//    }
//
//    public String getSeatCode() {
//        return seatCode;
//    }
//
//    public void setSeatCode(String seatCode) {
//        this.seatCode = seatCode;
//    }
//
//    public Aircraft getAircraft() {
//        return aircraft;
//    }
//
//    public void setAircraft(Aircraft aircraft) {
//        this.aircraft = aircraft;
//    }
//
//    public TravelClass getTravelClass() {
//        return travelClass;
//    }
//
//    public void setTravelClass(TravelClass travelClass) {
//        this.travelClass = travelClass;
//    }
//
//    public Ticket getTicket() {
//        return ticket;
//    }
//
//    public void setTicket(Ticket ticket) {
//        this.ticket = ticket;
//    }
//
//    public Seat() {
//    }
//}
