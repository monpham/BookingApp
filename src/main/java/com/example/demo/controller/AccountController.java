package com.example.demo.controller;

import com.example.demo.entity.Account;
import com.example.demo.entity.Guest;
import com.example.demo.entity.Role;
import com.example.demo.service.AccountService;
import com.example.demo.service.GuestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class AccountController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private GuestService guestService;
    @RequestMapping(value = "/login")
    public String goToLoginPage() {
        return "login";
    }
    @RequestMapping(value = "/register")
    public String goToRegisterPage(Model model) {
        model.addAttribute("account",new Account());
        return "register";
    }
    @RequestMapping("/handlingRegisterAccount")
    public String registerAccount(Account account){
        Account newAccount = new Account();
        newAccount.setUsername(account.getUsername());
        newAccount.setPassword(account.getPassword());
        List<Role> roles = new ArrayList<>();
        Role role = new Role();
        role.setRole("PASSENGER");
        roles.add(role);
        newAccount.setEnabled(true);
        newAccount.setRoles(roles);
        if (accountService.isException(newAccount)){
            return "redirect:/register";
        }else {
            accountService.saveAccount(newAccount);
            Guest guest = new Guest();
            guest.setFirstName(account.getGuest().getFirstName());
            guest.setLastName(account.getGuest().getLastName());
            guest.setEmail(account.getGuest().getEmail());
            guest.setPhoneNumber(account.getGuest().getPhoneNumber());
            guest.setAddress(account.getGuest().getAddress());
            guest.setAccount(accountService.getAccountByUsername(newAccount.getUsername()));
            guestService.saveGuest(guest);
            return "login";
        }
    }
}
