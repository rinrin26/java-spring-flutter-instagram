package com.commsult.test.instagram_services.lib.services;

import com.commsult.test.instagram_services.lib.entity.UsersEntity;
import com.commsult.test.instagram_services.lib.models.LoginUserRequest;
import com.commsult.test.instagram_services.lib.models.TokenResponse;
import com.commsult.test.instagram_services.lib.repositories.UserRepository;
import com.commsult.test.instagram_services.lib.security.BCrypt;
import jakarta.transaction.Transactional;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;
import jakarta.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.Set;
import java.util.UUID;

@Service
public class AuthService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private Validator validator;

    @Transactional
    public TokenResponse login(LoginUserRequest request){
        //30 hari expired
        Long expiryToken = System.currentTimeMillis() + (1000 * 60 * 60 * 24 * 30);

        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(request);
        if (constraintViolations.size() != 0) {
            throw new ConstraintViolationException(constraintViolations);
        }
        //check user ada atau gak?
        UsersEntity user = userRepository.findById(request.getUsername())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Username or password wrong"));
        //encryption passowrd
        if (BCrypt.checkpw(request.getPassword(), user.getPassword())) {
            user.setToken(UUID.randomUUID().toString());
            user.setTokenExpiredAt(expiryToken);
            userRepository.save(user);

            return TokenResponse.builder()
                    .username(user.getUsername())
                    .token(user.getToken())
                    .expiredAt(user.getTokenExpiredAt())
                    .build();
        } else {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Username or password wrong");
        }
    }
}
