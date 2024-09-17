package com.commsult.test.instagram_services.lib.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "posts")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PostEntity {
    @Id
    private  String id;

    @Column
    private String username;

    @Column
    private List<String> imgUrl;

    @CreationTimestamp
    private LocalDateTime createdAt;
}
