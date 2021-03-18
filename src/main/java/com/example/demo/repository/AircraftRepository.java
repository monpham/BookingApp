package com.example.demo.repository;

import com.example.demo.entity.Aircraft;
import com.example.demo.entity.Brand;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AircraftRepository extends CrudRepository<Aircraft, Integer> {
    Aircraft findByAircraftId(int aircraftId);
    boolean existsByModelAndBrand(String var1,Brand var2);
    List<Aircraft> findByBrandAndAircraftIdNot(Brand brand,int id);
}
