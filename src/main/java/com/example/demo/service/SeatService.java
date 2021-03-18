//package com.example.demo.service;
//
//import com.example.demo.entity.Aircraft;
//import com.example.demo.entity.Seat;
//import com.example.demo.entity.TravelClass;
//import com.example.demo.repository.AircraftRepository;
//import com.example.demo.repository.SeatRepository;
//import com.example.demo.repository.TravelClassRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.ArrayList;
//import java.util.List;
//
//@Service
//public class SeatService {
//    @Autowired
//    private SeatRepository seatRepository;
//
//    @Autowired
//    private TravelClassRepository travelClassRepository;
//
//    @Autowired
//    private AircraftRepository aircraftRepository;
//    public void generateSeatsForAircraft (Aircraft aircraft) {
//
//        for (int i = 1; i <= aircraft.getTotal_economy(); i++){
//            Seat seat = new Seat();
//            seat.setSeatCode("E" + i);
//            seat.setAircraft(aircraft);
//            seat.setTravelClass((TravelClass)travelClassRepository.findByTravelClassId(2));
//            seatRepository.save(seat);
//        }
//
//        for (int j = 1; j <= aircraft.getTotal_business(); j++){
//            Seat seat = new Seat();
//            seat.setSeatCode("B" + j);
//            seat.setAircraft(aircraft);
//            seat.setTravelClass((TravelClass)travelClassRepository.findByTravelClassId(1));
//            seatRepository.save(seat);
//        }
//    }
//
//    public void deleteSeatsByAircraftId(int aircraftId){
//        seatRepository.deleteAll(aircraftRepository.findByAircraftId(aircraftId).getSeatList());
//    }
//}
