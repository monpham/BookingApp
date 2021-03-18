package com.example.demo.service;

import com.example.demo.entity.Discount;
import com.example.demo.entity.Promotion;
import com.example.demo.repository.DiscountRepository;
import com.example.demo.repository.PromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PromotionService {
    @Autowired
    private PromotionRepository promotionRepository;
    @Autowired
    private DiscountRepository discountRepository;

    public List<Promotion> getAllPromotions(){return (List<Promotion>) promotionRepository.findAll();}

    public boolean savePromotion(Promotion promotion){
        try{
            promotionRepository.save(promotion);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public boolean deletePromotion(int id){
        try {
            for (Discount discount : discountRepository.findByPromotionPromotionId(id)){
                discountRepository.delete(discount);
            }
            promotionRepository.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public boolean isException(Promotion promotion){
        boolean ex = false;
        if(promotion.getStartDate().isAfter(promotion.getEndDate()))ex = true;
        return ex;
    }

    public Promotion getPromotionById(int id){return  promotionRepository.findByPromotionId(id);}
}

