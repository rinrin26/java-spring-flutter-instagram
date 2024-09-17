package com.commsult.test.instagram_services.lib.controller;

import com.commsult.test.instagram_services.lib.entity.CommentEntity;
import com.commsult.test.instagram_services.lib.models.ApiResponse;
import com.commsult.test.instagram_services.lib.models.CommentRequest;
import com.commsult.test.instagram_services.lib.models.CommentResponse;
import com.commsult.test.instagram_services.lib.services.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/")
public class CommentsController {
    @Autowired
    private CommentService commentService;

    @PostMapping("comment")
    public ApiResponse<CommentResponse> comment(@RequestBody CommentRequest request){
        CommentResponse response =  commentService.comment(request);
        return ApiResponse.<CommentResponse>builder().data(response).build();
    }

    @GetMapping("comments")
    public ApiResponse<List<CommentEntity>> getComments(){
        return ApiResponse.<List<CommentEntity>>builder().data(commentService.getComments()).build();
    }
}