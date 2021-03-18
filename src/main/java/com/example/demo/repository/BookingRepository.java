package com.example.demo.repository;

import com.example.demo.entity.Booking;
import com.example.demo.entity.Payment;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface BookingRepository extends CrudRepository<Booking, Integer> {
    Booking findByPayment(Payment payment);
    Booking findByPaymentPaymentId(int paymentId);

    @Query("select b from Booking b where b.payment.paymentDate >= :startDate and b.payment.paymentDate <= :endDate")
    List<Booking> findByPaymentPaymentDateBetween(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    Booking findByBookingId(int bookingId);
}
