package com.example.demo.repository;

import com.example.demo.entity.CreditCard;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CreditCardRepository extends CrudRepository <CreditCard, Integer> {
    CreditCard findByCardNumber(String cardNumber);

}
