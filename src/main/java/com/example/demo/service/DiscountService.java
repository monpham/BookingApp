package com.example.demo.service;

import com.example.demo.entity.Discount;
import com.example.demo.repository.DiscountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DiscountService {
    @Autowired
    private DiscountRepository discountRepository;

    public List<Discount> getAllDiscount(){return (List<Discount>) discountRepository.findAll();}

    public Discount getDiscountById(int id){
        return discountRepository.findByDiscountId(id);
    }
    public boolean saveDiscount(Discount discount){
        try{
            discountRepository.save(discount);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public boolean deleteDiscount(int id){
        try {
            discountRepository.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
