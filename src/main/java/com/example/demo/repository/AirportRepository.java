package com.example.demo.repository;

import com.example.demo.entity.Airport;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AirportRepository extends CrudRepository<Airport, Integer> {
//    List<Airport> findByAirportId(int id);
    Airport findByAirportId(int id);
    boolean existsByAirportName(String var);

    Airport findByCityCityName(String cityName);
}
