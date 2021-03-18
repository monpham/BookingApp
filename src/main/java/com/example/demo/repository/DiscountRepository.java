package com.example.demo.repository;

import com.example.demo.entity.Discount;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiscountRepository extends CrudRepository<Discount, Integer> {
    List<Discount> findByPromotionPromotionId(int id);
    Discount findByDiscountId(int id);
}
