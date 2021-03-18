package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "employee")
public class EmployeeController {
    @RequestMapping(value = "/employeePage")
    public String goToEmployeePage() {
        return "employee2";
    }
}
