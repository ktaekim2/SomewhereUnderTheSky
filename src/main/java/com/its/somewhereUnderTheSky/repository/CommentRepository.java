package com.its.somewhereUnderTheSky.repository;

import com.its.somewhereUnderTheSky.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.save", commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        return sql.selectList("Comment.findAll", boardId);
    }

    public void delete(Long id) {
        sql.delete("Comment.delete", id);
    }

    public CommentDTO findById(Long id) {
        return sql.selectOne("Comment.findById", id);
    }

    public void update(CommentDTO commentDTO) {
        sql.update("Comment.update", commentDTO);
    }

    public void updateLikes(Long id) {
        sql.update("Comment.updateLikes", id);
    }

    public void updateDislikes(Long id) {
        sql.update("Comment.updateDislikes", id);
    }
}
