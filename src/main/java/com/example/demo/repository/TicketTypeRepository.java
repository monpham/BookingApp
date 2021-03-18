package com.example.demo.repository;

import com.example.demo.entity.TicketType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TicketTypeRepository extends CrudRepository <TicketType, Integer> {
    TicketType findByTicketTypeName(String name);
    TicketType findByTicketTypeId(int id);
    boolean existsByTicketTypeName(String var);
}
