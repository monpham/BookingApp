package com.example.demo.entity;


import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "booking")
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "booking_id")
    private int bookingId;

    @ManyToOne
    @JoinColumn(name = "guest_id")
    private Guest guest;

    @OneToOne
    @JoinColumn(name = "payment_id")
    private Payment payment;

    @OneToMany(mappedBy = "booking")
    private List<Ticket> tickets;

    public Booking() {
    }

    public Booking(Guest guest, Payment payment) {
        this.guest = guest;
        this.payment = payment;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public Guest getGuest() {
        return guest;
    }

    public void setGuest(Guest guest) {
        this.guest = guest;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }
    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }
}
