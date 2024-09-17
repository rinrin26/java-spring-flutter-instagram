package com.commsult.test.instagram_services.lib.repositories;

import com.commsult.test.instagram_services.lib.entity.CommentEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
public interface CommentsRepository extends JpaRepository<CommentEntity, String> {
    Optional<CommentEntity> findByPostId(String postId);
}