package com.commsult.test.instagram_services.lib.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UuidGenerator;

import java.time.LocalDateTime;

@Entity
@Table(name = "comments")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class CommentEntity {
    @Id
    @GeneratedValue
    @UuidGenerator
    private  String id;

    @Column
    private String username;

    @Column
    private String postId;
    @Column
    private String commentText;

    @CreationTimestamp
    private LocalDateTime createdAt;
}
