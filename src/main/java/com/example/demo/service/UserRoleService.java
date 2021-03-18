package com.example.demo.service;

import com.example.demo.entity.Role;
import com.example.demo.repository.UserRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserRoleService {
    @Autowired
    private UserRoleRepository userRoleRepository;

    public List<Role> getAllRoles(){return (List<Role>) userRoleRepository.findAll();}
}
