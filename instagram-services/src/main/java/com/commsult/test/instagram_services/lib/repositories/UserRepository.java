package com.commsult.test.instagram_services.lib.repositories;

import com.commsult.test.instagram_services.lib.entity.UsersEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<UsersEntity, String> {
    Optional<UsersEntity> findByUsername(String username);
    Optional<UsersEntity> findByToken(String token);
}