package com.example.demo.object;

import java.util.List;

public class DepartureTrip {
    private int departureFlightId;
    private String travelClass;
    private List<SeatPossession> departureSeatPossessions;
    private int adults;
    private int children;
    private int infant;

    public DepartureTrip() {
    }

    public List<SeatPossession> getDepartureSeatPossessions() {
        return departureSeatPossessions;
    }

    public void setDepartureSeatPossessions(List<SeatPossession> departureSeatPossessions) {
        this.departureSeatPossessions = departureSeatPossessions;
    }

    public int getDepartureFlightId() {
        return departureFlightId;
    }

    public void setDepartureFlightId(int departureFlightId) {
        this.departureFlightId = departureFlightId;
    }

    public String getTravelClass() {
        return travelClass;
    }

    public void setTravelClass(String travelClass) {
        this.travelClass = travelClass;
    }

    public int getAdults() {
        return adults;
    }

    public void setAdults(int adults) {
        this.adults = adults;
    }

    public int getChildren() {
        return children;
    }

    public void setChildren(int children) {
        this.children = children;
    }

    public int getInfant() {
        return infant;
    }

    public void setInfant(int infant) {
        this.infant = infant;
    }
}
