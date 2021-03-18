package com.example.demo.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Entity
@Table(name = "promotion")
public class Promotion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "promotion_id")
    private int promotionId;

    @Column(name = "event_name")
    private String eventName;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "start_date")
    private LocalDate startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "end_date")
    private LocalDate endDate;

    @Column(name = "image")
    private String image;

    @Transient
    private String _startDate;
    @Transient
    private String _endDate;

    @Transient
    private double discount_amount_max;

    @OneToMany(mappedBy = "promotion")
    private List<Discount> discounts;

    public Promotion() {
    }

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public List<Discount> getDiscounts() {
        return discounts;
    }

    public void setDiscounts(List<Discount> discounts) {
        this.discounts = discounts;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public double getDiscount_amount_max() {
        double max = 0;
        for (Discount d : this.discounts){
            max = (max < d.getDiscountAmount()) ? d.getDiscountAmount() : max;
        }
        this.discount_amount_max = max;
        return discount_amount_max;
    }

    public String get_startDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy");
        return this.getStartDate().format(formatter);
    }

    public String get_endDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy");
        return this.getEndDate().format(formatter);
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }
}
