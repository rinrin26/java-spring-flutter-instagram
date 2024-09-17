package com.commsult.test.instagram_services.lib.services;

import com.commsult.test.instagram_services.lib.entity.CommentEntity;
import com.commsult.test.instagram_services.lib.models.CommentRequest;
import com.commsult.test.instagram_services.lib.models.CommentResponse;
import com.commsult.test.instagram_services.lib.repositories.CommentsRepository;
import jakarta.transaction.Transactional;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;
import jakarta.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class CommentService {
    @Autowired
    private CommentsRepository commentsRepository;

    @Autowired
    private Validator validator;

    @Transactional
    public CommentResponse comment(CommentRequest request) {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(request);
        if (constraintViolations.size() != 0) {
            throw new ConstraintViolationException(constraintViolations);
        }

        CommentEntity comment = new CommentEntity();
        comment.setCommentText(request.getCommentText());
        comment.setPostId(request.getPostId());
        comment.setUsername(request.getUsername());

        commentsRepository.save(comment);

        return CommentResponse.builder()
                .id(comment.getId())
                .commentText(comment.getCommentText())
                .postId(comment.getPostId())
                .username(comment.getUsername())
                .createdAt(comment.getCreatedAt())
                .build();
    }
    @Transactional()
    public List<CommentEntity> getComments() {
        return commentsRepository.findAll();
    }
}
