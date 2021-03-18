package com.example.demo.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "aircraft")
public class Aircraft {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "aircraft_id")
    private int aircraftId;
    @Column(name = "model")
    private String model;
    @Column(name = "total_economy")
    private int total_economy;
    @Column(name = "total_business")
    private int total_business;
    @Column(name = "logo_airline")
    private String logo_airline;
    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brand;
    @OneToMany(mappedBy = "aircraft", fetch = FetchType.LAZY)
    private List<Flight> flightList;

    public int getAircraftId() {
        return aircraftId;
    }

    public void setAircraftId(int aircraftId) {
        this.aircraftId = aircraftId;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getTotal_economy() {
        return total_economy;
    }

    public void setTotal_economy(int total_economy) {
        this.total_economy = total_economy;
    }

    public int getTotal_business() {
        return total_business;
    }

    public void setTotal_business(int total_business) {
        this.total_business = total_business;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public List<Flight> getFlightList() {
        return flightList;
    }

    public void setFlightList(List<Flight> flightList) {
        this.flightList = flightList;
    }

    public String getLogo_airline() {
        return logo_airline;
    }

    public void setLogo_airline(String logo_airline) {
        this.logo_airline = logo_airline;
    }

    public Aircraft() {
    }
}
