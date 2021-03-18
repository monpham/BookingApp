package com.example.demo.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "ticket_type")
public class TicketType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ticket_type_id")
    private int ticketTypeId;

    @Column(name = "ticket_type_name")
    private String ticketTypeName;

    @Column(name = "rate")
    private double rate;


    @OneToMany(mappedBy = "ticketType")
    private List<Ticket> tickets;

    public TicketType() {
    }

    public int getTicketTypeId() {
        return ticketTypeId;
    }

    public void setTicketTypeId(int ticketTypeId) {
        this.ticketTypeId = ticketTypeId;
    }

    public String getTicketTypeName() {
        return ticketTypeName;
    }

    public void setTicketTypeName(String ticketTypeName) {
        this.ticketTypeName = ticketTypeName;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }


    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }
}
