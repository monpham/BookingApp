package com.example.demo.repository;

import com.example.demo.entity.Brand;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface BrandRepository extends CrudRepository<Brand, Integer> {
    boolean existsByBrandName(String var);
    Brand findByBrandId(int id);
}
