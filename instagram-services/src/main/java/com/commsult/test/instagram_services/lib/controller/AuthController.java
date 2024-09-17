package com.commsult.test.instagram_services.lib.controller;

import com.commsult.test.instagram_services.lib.entity.UsersEntity;
import com.commsult.test.instagram_services.lib.models.ApiResponse;
import com.commsult.test.instagram_services.lib.models.LoginUserRequest;
import com.commsult.test.instagram_services.lib.models.TokenResponse;
import com.commsult.test.instagram_services.lib.repositories.UserRepository;
import com.commsult.test.instagram_services.lib.services.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private UserRepository repository;
    @Autowired
    private AuthService authService;
    @PostMapping("/login")
    public ApiResponse<TokenResponse> login(@RequestBody LoginUserRequest request){
        TokenResponse tokenResponse = authService.login(request);
        return ApiResponse.<TokenResponse>builder().data(tokenResponse).build();
    }
    @GetMapping("/hi")
    public String getHi() {
        String hi = "Hello Rin";

        return hi;
    }
    @GetMapping("/{username}")
    public UsersEntity getUser(@PathVariable String username) {
        return repository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("user not found"));
    }
}