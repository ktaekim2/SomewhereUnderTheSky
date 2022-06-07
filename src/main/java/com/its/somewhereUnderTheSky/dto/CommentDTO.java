package com.its.somewhereUnderTheSky.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {
    private Long id;
    private String commentWriter;
    private String commentContents;
    private Timestamp commentCreatedDate;
    private Long boardId;
    private Long commentLikes;
    private Long commentDislikes;
}
