package com.dms.demo.service.dao;

import com.dms.demo.domain.Role;
import com.dms.demo.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;


public interface UserRepo extends JpaRepository<User, Long> {
    Optional<User> findByIdUser(Long id);

    Optional<User> findByUsername(String username);

    List<User> findAllByUsernameIsNot(String username);

    List<User> findAllByRoles(Role role);

}
