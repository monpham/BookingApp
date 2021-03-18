package com.example.demo.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "airport")
public class Airport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "airport_id")
    private int airportId;
    @Column(name = "airport_name")
    private String airportName;
    @OneToOne
    @JoinColumn(name = "city_id")
    private City city;
    @OneToMany(mappedBy = "originAirport")
    private List<FlightRoute> originRouteList;
    @OneToMany(mappedBy = "destinationAirport")
    private List<FlightRoute> destinationRouteList;

    public int getAirportId() {
        return airportId;
    }

    public void setAirportId(int airportId) {
        this.airportId = airportId;
    }

    public String getAirportName() {
        return airportName;
    }

    public void setAirportName(String airportName) {
        this.airportName = airportName;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public List<FlightRoute> getOriginRouteList() {
        return originRouteList;
    }

    public void setOriginRouteList(List<FlightRoute> originRouteList) {
        this.originRouteList = originRouteList;
    }

    public List<FlightRoute> getDestinationRouteList() {
        return destinationRouteList;
    }

    public void setDestinationRouteList(List<FlightRoute> destinationRouteList) {
        this.destinationRouteList = destinationRouteList;
    }

    public Airport() {
    }
}
