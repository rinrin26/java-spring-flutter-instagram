package com.commsult.test.instagram_services.lib.models;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentResponse {
    private String id;

    @NotBlank
    @Size(max = 100)
    private String postId;

    @NotBlank
    @Size(max = 500, message = "Comment text cannot exceed 500 characters")
    private String commentText;

    @NotBlank
    @Size(max = 100)
    private String username;

    private LocalDateTime createdAt;
}
