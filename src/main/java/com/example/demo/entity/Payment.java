package com.example.demo.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "payment")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_id")
    private int paymentId;
    @Column(name = "payment_method")
    private String paymentMethod;
    @Column(name = "status")
    private boolean status;

    @Column(name = "session_id")
    private String sessionId;


    @Column(name = "payment_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate paymentDate;

    @Column(name = "total_payment")
    private double totalPayment;

    @ManyToOne
    @JoinColumn(name = "credit_card_id")
    private CreditCard creditCard;

    @OneToOne(mappedBy = "payment")
    private Booking booking;


    public Payment() {
    }

    public Payment(String paymentMethod, boolean status, String sessionId, double totalPayment, CreditCard creditCard) {
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.sessionId = sessionId;
        this.totalPayment = totalPayment;
        this.creditCard = creditCard;
    }

    public Payment(String paymentMethod, boolean status, String sessionId, LocalDate paymentDate, double totalPayment, CreditCard creditCard) {
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.sessionId = sessionId;
        this.paymentDate = paymentDate;
        this.totalPayment = totalPayment;
        this.creditCard = creditCard;
    }

    public Payment(String paymentMethod, boolean status, String sessionId, double totalPayment) {
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.sessionId = sessionId;
        this.totalPayment = totalPayment;
    }

    public Payment(String paymentMethod, boolean status, CreditCard creditCard, String sessionId) {
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.sessionId = sessionId;
        this.creditCard = creditCard;
    }

    public LocalDate getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate (LocalDate paymentDate) {
        this.paymentDate = paymentDate;
    }

    public double getTotalPayment() {
        return totalPayment;
    }

    public void setTotalPayment(double totalPayment) {
        this.totalPayment = totalPayment;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public Payment(String paymentMethod, boolean status, CreditCard creditCard, Booking booking) {
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.creditCard = creditCard;
        this.booking = booking;
    }

    public Payment(String paymentMethod, boolean status, CreditCard creditCard) {
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.creditCard = creditCard;
    }

    public CreditCard getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(CreditCard creditCard) {
        this.creditCard = creditCard;
    }
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }
}
