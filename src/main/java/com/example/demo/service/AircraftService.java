package com.example.demo.service;

import com.example.demo.entity.Aircraft;
import com.example.demo.entity.Brand;
import com.example.demo.repository.AircraftRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AircraftService {
    @Autowired
    private AircraftRepository aircraftRepository;

    public List<Aircraft> getAllAircraft (){
        return (List<Aircraft>) aircraftRepository.findAll();
    }
    public Map<Integer, String> getAllAircraftWithMapType(){
        Map<Integer, String> aircraftListMap = new HashMap<>();
        List<Aircraft> aircraft = getAllAircraft();
        if (!aircraft.isEmpty()){
            for (Aircraft a: aircraft){
                aircraftListMap.put(a.getAircraftId(), a.getModel());
            }
        }
        return aircraftListMap;
    }
    public boolean saveAircraft (Aircraft aircraft) {
        try{
            aircraftRepository.save(aircraft);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public boolean deleteAircraftById (int aircraftId){
        try{
            aircraftRepository.deleteById(aircraftId);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public boolean isException(Aircraft aircraft){
        boolean ex = false;
        if (aircraftRepository.findByAircraftId(aircraft.getAircraftId())!=null){
            for (Aircraft a : aircraftRepository.findByBrandAndAircraftIdNot(aircraft.getBrand(),aircraft.getAircraftId())){
                if (aircraft.getModel().equals(a.getModel())){
                    System.out.println(a.getModel());
                    ex = true;
                }
            }
        }
        else {
            if (aircraftRepository.existsByModelAndBrand(aircraft.getModel(),aircraft.getBrand())) ex = true;
        }
        return ex;
    }
    public Aircraft getAircraftById (int aircraftId){
        return aircraftRepository.findByAircraftId(aircraftId);
    }
}
