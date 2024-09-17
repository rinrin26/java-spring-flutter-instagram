package com.commsult.test.instagram_services.lib.controller;

import com.commsult.test.instagram_services.lib.entity.UsersEntity;
import com.commsult.test.instagram_services.lib.models.ApiResponse;
import com.commsult.test.instagram_services.lib.models.RegisterUserRequest;
import com.commsult.test.instagram_services.lib.models.UserResponse;
import com.commsult.test.instagram_services.lib.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public ApiResponse<String> register(@RequestBody RegisterUserRequest request){
        userService.register(request);
        return ApiResponse.<String>builder().data("Successfully create account").build();
    }

    @GetMapping(
            path = "/current",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ApiResponse<UserResponse> get(UsersEntity user) {
        UserResponse userResponse = userService.get(user);
        return ApiResponse.<UserResponse>builder().data(userResponse).build();
    }
}
