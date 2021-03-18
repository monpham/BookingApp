package com.example.demo.object;

public class DatePicker {
    private int day;
    private int month;
    private int year;

    public DatePicker() {
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    @Override
    public String toString() {
        return "DatePicker [year=" + year + ", month=" + month + ", day=" + day + "]";
    }
}
