package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/passenger")
public class PassengerController {

    @RequestMapping(value = "/passengerPage", method = RequestMethod.GET)
    public String goToPassengerPage() {
        return "passenger";
    }
}
