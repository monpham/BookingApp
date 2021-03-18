package com.example.demo.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "flight_route")
public class FlightRoute {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "route_id")
    private int routeId;
    @ManyToOne
    @JoinColumn(name = "origin_airport_id")
    private Airport originAirport;
    @ManyToOne
    @JoinColumn(name = "destination_airport_id")
    private Airport destinationAirport;
    @OneToMany(mappedBy = "flightRoute", fetch = FetchType.LAZY)
    private List<Flight> flightList;

    public FlightRoute() {
    }

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public Airport getOriginAirport() {
        return originAirport;
    }

    public void setOriginAirport(Airport originAirport) {
        this.originAirport = originAirport;
    }

    public Airport getDestinationAirport() {
        return destinationAirport;
    }

    public void setDestinationAirport(Airport destinationAirport) {
        this.destinationAirport = destinationAirport;
    }

    public List<Flight> getFlightList() {
        return flightList;
    }

    public void setFlightList(List<Flight> flightList) {
        this.flightList = flightList;
    }
}
