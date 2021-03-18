package com.example.demo.service;

import com.example.demo.entity.Booking;
import com.example.demo.entity.Payment;
import com.example.demo.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class BookingService {
    @Autowired
    private BookingRepository bookingRepository;

    public List<Booking> getAllBookingsByPaymentDateBetween (LocalDate startDate, LocalDate endDate) {
        return bookingRepository.findByPaymentPaymentDateBetween(startDate, endDate);
    }
    public List<Booking> getAllBookingsData () {
        return (List<Booking>) bookingRepository.findAll();
    }
    public void saveNewBookingData (Booking booking) {
        bookingRepository.save(booking);
    }

    public Booking getBookingByPayment (Payment payment) {
        return bookingRepository.findByPayment(payment);
    }

    public Booking getBookingByPaymentId (int paymentId) {
        return  bookingRepository.findByPaymentPaymentId(paymentId);
    }

    public boolean deleteBookingByBookingId (int bookingId) {
        try {
            bookingRepository.deleteById(bookingId);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Booking getBookingByBookingId (int bookingId) {
        return  bookingRepository.findByBookingId(bookingId);
    }

}
