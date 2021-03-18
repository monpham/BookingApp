package com.example.demo.repository;

import com.example.demo.entity.Aircraft;
import com.example.demo.entity.Flight;
import com.example.demo.entity.FlightRoute;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface FlightRepository extends CrudRepository<Flight, Integer> {
    Flight findByFlightId(int id);

    // xu ly loi add va edit flight
    boolean existsByDepartureTimeAndArrivalTimeAndFlightRouteAndAircraft(LocalDateTime var1, LocalDateTime var2, FlightRoute var3, Aircraft var4);

    List<Flight> findByFlightRouteAndAircraft(FlightRoute var1, Aircraft var2);
    // end

    @Query("select f from Flight f " +
            "where f.flightRoute.originAirport.airportName like %:origin% " +
            "and f.flightRoute.destinationAirport.airportName like %:destination% " +
            "and f.departureTime >= :departureTime and " +
            " f.departureTime <= :departureTime2")
    List<Flight> findFlightsByFlightRouteAndDepartureTime(@Param("origin") String origin, @Param("destination") String destination, @Param("departureTime") LocalDateTime departureTime, @Param("departureTime2") LocalDateTime departureTime2);

    @Query("select f from Flight f " +
            "where f.departureTime >= :departureTime and " +
            " f.departureTime <= :departureTime2")
    List<Flight> findByDepartureTimeHere(@Param("departureTime") LocalDateTime departureTime, @Param("departureTime2") LocalDateTime departureTime2);

    List<Flight> findByFlightRouteOriginAirportCityCityNameAndEconomyPriceLessThan(String var1, double var2);

    /*@Query("select f from Flight f" +
            " where f.departureTime = :departureTime")*/
 /*   List<Flight> findByDepartureTime(LocalDateTime date);
    List<Flight> findByDepartureTimeBetween(LocalDateTime date, LocalDateTime date2);*/
}
