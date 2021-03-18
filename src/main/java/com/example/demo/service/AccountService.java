package com.example.demo.service;

import com.example.demo.entity.Account;
import com.example.demo.repository.AccountRepository;
import com.example.demo.repository.GuestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountService {
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private GuestRepository guestRepository;

    public List<Account> getAllAccounts(){return (List<Account>) accountRepository.findAll();}

    public Account getAccountById(int id){return accountRepository.findByAccountId(id);}

    public boolean saveAccount(Account account){
        try {
            accountRepository.save(account);
            return true;
        }catch (Exception e){
            System.out.println(e);
            return false;
        }
    }

    public boolean deleteAccount(int id){
        try {
            if (accountRepository.findByAccountId(id).getGuest()!=null){
                guestRepository.deleteById(accountRepository.findByAccountId(id).getGuest().getGuestId());
                accountRepository.deleteById(id);
            }else {
                accountRepository.deleteById(id);
            }
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public boolean isException(Account account){
        boolean ex = false;
        if (accountRepository.existsByUsername(account.getUsername()))ex = true;
        System.out.println(ex);
        return ex;
    }

    public Account getAccountByUsername(String var){
        return accountRepository.findByUsername(var);
    }
}
