package com.example.demo.repository;

import com.example.demo.entity.TravelClass;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TravelClassRepository extends CrudRepository<TravelClass,Integer> {
    TravelClass findByTravelClassId(int id);
    TravelClass findByClassName(String className);
}
