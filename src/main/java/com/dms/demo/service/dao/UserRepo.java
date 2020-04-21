package com.dms.demo.service.dao;

import com.dms.demo.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
