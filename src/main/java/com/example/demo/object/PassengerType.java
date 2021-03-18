package com.example.demo.object;

public class PassengerType {
    private int numberOfAdults;
    private int numberOfChildren;
    private int numberOfInfant;

    public PassengerType() {
    }

    public int getNumberOfAdults() {
        return numberOfAdults;
    }

    private void init() {
        numberOfAdults = 1;
    }

    public void setNumberOfAdults(int numberOfAdults) {
        this.numberOfAdults = numberOfAdults;
    }

    public int getNumberOfChildren() {
        return numberOfChildren;
    }

    public void setNumberOfChildren(int numberOfChildren) {
        this.numberOfChildren = numberOfChildren;
    }

    public int getNumberOfInfant() {
        return numberOfInfant;
    }

    public void setNumberOfInfant(int numberOfInfant) {
        this.numberOfInfant = numberOfInfant;
    }
}
