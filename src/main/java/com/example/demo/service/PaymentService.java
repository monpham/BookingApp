package com.example.demo.service;

import com.example.demo.entity.Payment;
import com.example.demo.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {
    @Autowired
    private PaymentRepository paymentRepository;

    public void saveNewPayment (Payment payment) {
        paymentRepository.save(payment);
    }

    public Payment getPaymentBySessionId (String sessionId) {
        return paymentRepository.findBySessionId(sessionId);
    }
}
