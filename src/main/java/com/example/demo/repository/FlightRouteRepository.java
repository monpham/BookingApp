package com.example.demo.repository;

import com.example.demo.entity.Aircraft;
import com.example.demo.entity.Airport;
import com.example.demo.entity.FlightRoute;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FlightRouteRepository extends CrudRepository<FlightRoute, Integer> {
    FlightRoute findByRouteId(int id);

    List<FlightRoute> findByOriginAirport(Airport airport);

    @Query(value = "select fr.* from flight_route fr\n" +
            "join airport a \n" +
            "on fr.destination_airport_id = a.airport_id\n" +
            "where fr.origin_airport_id in (select airport_id from airport a2 where lower(a2.airport_name) like %:origin%)", nativeQuery = true)
    List<FlightRoute> findByOriginName(@Param("origin") String origin);

    @Query("select f from FlightRoute f where f.originAirport.city.cityName like %:originCityName%")
    List<FlightRoute> findByOriginCityName(@Param("originCityName") String originCityName);
}
