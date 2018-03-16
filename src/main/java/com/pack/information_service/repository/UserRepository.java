package com.pack.information_service.repository;

import com.pack.information_service.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByIdUser(Long IdUser);

    User findByUsername(String username);

}
