package com.example.demo.service;

import com.example.demo.entity.TicketType;
import com.example.demo.repository.TicketTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TicketTypeService {
    @Autowired
    private TicketTypeRepository ticketTypeRepository;

    public TicketType getTicketTypeByTicketTypeName (String ticketTypeName) {
        return ticketTypeRepository.findByTicketTypeName(ticketTypeName);
    }

    public boolean deleteTicketType(int id){
        try{
            deleteTicketType(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public boolean saveTicketType(TicketType ticketType){
        try{
            saveTicketType(ticketType);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public TicketType getTicketTypeById(int id){
        return ticketTypeRepository.findByTicketTypeId(id);
    }
    public List<TicketType> getAllTicketTypes(){
        return (List<TicketType>) ticketTypeRepository.findAll();
    }
    public boolean isException(TicketType ticketType){
        return ticketTypeRepository.existsByTicketTypeName(ticketType.getTicketTypeName());
    }
}
