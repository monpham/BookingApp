package com.example.demo.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "travel_class")
public class TravelClass {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "class_id")
    private int travelClassId;
    @Column(name = "class_name")
    private String className;
    /*@Column(name = "rate")
    private double rate;*/

    @OneToMany(mappedBy = "travelClass")
    private List<Ticket> tickets;

    public TravelClass() {
    }

    /*public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }*/

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }

    public int getTravelClassId() {
        return travelClassId;
    }

    public void setTravelClassId(int travelClassId) {
        this.travelClassId = travelClassId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }


}
