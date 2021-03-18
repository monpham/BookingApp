package com.example.demo.service;

import com.example.demo.entity.CreditCard;
import com.example.demo.repository.CreditCardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CreditCardService {
    @Autowired
    private CreditCardRepository creditCardRepository;

    public CreditCard getCreditCardByCardNumber (String cardNumber){
        return creditCardRepository.findByCardNumber(cardNumber);
    }

    public void saveCreditCardData (CreditCard creditCard) {
        creditCardRepository.save(creditCard);
    }
}
