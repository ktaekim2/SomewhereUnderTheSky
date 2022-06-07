package com.its.somewhereUnderTheSky.controller;

import com.its.somewhereUnderTheSky.dto.CommentDTO;
import com.its.somewhereUnderTheSky.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return commentDTOList;
    }

    @GetMapping("/delete")
    public String delete(@ModelAttribute CommentDTO commentDTO) {
        Long id = commentDTO.getId();
        commentService.delete(id);
        return "redirect:/board/detail?id=" + commentDTO.getBoardId();
    }
}
