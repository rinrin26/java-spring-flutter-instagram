package com.commsult.test.instagram_services.lib.services;

import com.commsult.test.instagram_services.lib.entity.UsersEntity;
import com.commsult.test.instagram_services.lib.models.RegisterUserRequest;
import com.commsult.test.instagram_services.lib.models.UserResponse;
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

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private Validator validator;

    @Transactional
    public void register(RegisterUserRequest request){
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(request);
        if (constraintViolations.size() != 0) {
            throw new ConstraintViolationException(constraintViolations);
        }
        if(userRepository.existsById(request.getUsername())){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Username already registered");
        }

        UsersEntity user = new UsersEntity();
        user.setUsername(request.getUsername());
        user.setPassword(BCrypt.hashpw(request.getPassword(), BCrypt.gensalt()));
        user.setName(request.getName());

        userRepository.save(user);
    }

    public UserResponse get(UsersEntity user) {
        return UserResponse.builder()
                .username(user.getUsername())
                .name(user.getName())
                .build();
    }


}
