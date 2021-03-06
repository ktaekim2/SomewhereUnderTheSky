package com.its.somewhereUnderTheSky.service;


import com.its.somewhereUnderTheSky.dto.CommentDTO;
import com.its.somewhereUnderTheSky.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        return commentRepository.findAll(boardId);
    }

    public void delete(Long id) {
        commentRepository.delete(id);
    }

    public CommentDTO findById(Long id) {
        return commentRepository.findById(id);
    }

    public void update(CommentDTO commentDTO) {
        commentRepository.update(commentDTO);
    }

    public void updateLikes(Long id) {
        commentRepository.updateLikes(id);
    }

    public void updateDislikes(Long id) {
        commentRepository.updateDislikes(id);
    }
}
