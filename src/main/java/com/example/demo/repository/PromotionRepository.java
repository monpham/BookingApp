package com.example.demo.repository;

import com.example.demo.entity.Discount;
import com.example.demo.entity.Promotion;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PromotionRepository extends CrudRepository<Promotion, Integer> {
    Promotion findByPromotionId(int id);
}
