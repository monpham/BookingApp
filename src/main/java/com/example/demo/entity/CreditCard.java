package com.example.demo.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "credit_card")
public class CreditCard {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "credit_card_id")
    private int creditCardId;

    @Column(name = "card_number")
    private String cardNumber;

    @Column(name = "owner_name")
    private String ownerName;

    //One time password
    @Column(name = "otp")
    private String OTP;

    @Column(name = "balance")
    private double balance;

    @Column(name = "type")
    private String type;

    @OneToMany(mappedBy = "creditCard")
    private List<Payment> payments;


    public CreditCard() {
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public int getCreditCardId() {
        return creditCardId;
    }

    public void setCreditCardId(int creditCardId) {
        this.creditCardId = creditCardId;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getOTP() {
        return OTP;
    }

    public void setOTP(String OTP) {
        this.OTP = OTP;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Payment> getPayments() {
        return payments;
    }

    public void setPayments(List<Payment> payments) {
        this.payments = payments;
    }
}
