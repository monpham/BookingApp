package com.example.demo.service;

import com.example.demo.entity.Brand;
import com.example.demo.repository.BrandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BrandService {
    @Autowired
    private BrandRepository brandRepository;

    public List<Brand> getAllAircraftBrands() {
        return (List<Brand>) brandRepository.findAll();
    }

    public Map<Integer, String> getAllAircraftBrandsWithMapType() {
        Map<Integer, String> aircraftBrands = new HashMap<>();
        List<Brand> brandList = getAllAircraftBrands();
        if (!brandList.isEmpty()) {
            for (Brand b : brandList) {
                aircraftBrands.put(b.getBrandId(), b.getBrandName());
            }
        }
        return aircraftBrands;
    }
    public Brand getBrandById(int id){return brandRepository.findByBrandId(id);}
    public boolean saveBrand(Brand brand){
        try {
            brandRepository.save(brand);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public boolean deleteBrand(int id){
        try {
            brandRepository.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public boolean isException(Brand brand){
        return brandRepository.existsByBrandName(brand.getBrandName());
    }
}
