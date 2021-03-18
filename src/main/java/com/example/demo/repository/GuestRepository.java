package com.example.demo.repository;

import com.example.demo.entity.Guest;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GuestRepository extends CrudRepository<Guest, Integer> {
    /*@Query("select g from Guest g " +
            "where g.firstName like %:firstName% " +
            "and g.lastName like %:lastName% " +
            "and g.phoneNumber like %:phoneNumber% " +
            "and g.email like %:email%")*/
    List<Guest> findAllByFirstNameLikeAndLastNameLikeAndPhoneNumberLikeAndEmailLike(String firstName, String lastName, String phoneNumber, String email);
    Guest findByFirstNameAndLastNameAndPhoneNumberAndEmail(String firstName, String lastName, String phoneNumber, String email);
    Guest findByGuestId(int id);
}
