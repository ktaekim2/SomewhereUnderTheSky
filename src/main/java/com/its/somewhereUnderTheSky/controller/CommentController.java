package com.its.somewhereUnderTheSky.controller;

import com.its.somewhereUnderTheSky.dto.BoardDTO;
import com.its.somewhereUnderTheSky.dto.CommentDTO;
import com.its.somewhereUnderTheSky.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO) {
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

    @GetMapping("/update")
    public String updateForm(@ModelAttribute CommentDTO commentDTO, Model model) {
        Long id = commentDTO.getId();
        CommentDTO commentDTO1 = commentService.findById(id);
        model.addAttribute("comment", commentDTO1);
        return "/commentPages/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute CommentDTO commentDTO) {
        commentService.update(commentDTO);
        return "redirect:/board/detail?id=" + commentDTO.getBoardId();
    }

    @PostMapping("/updateLikes")
    public @ResponseBody List<CommentDTO> updateLikes(@ModelAttribute CommentDTO commentDTO) {
        Long id = commentDTO.getId();
        commentService.updateLikes(id);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return commentDTOList;
    }

    @PostMapping("/updateDislikes")
    public @ResponseBody List<CommentDTO> updateDislikes(@ModelAttribute CommentDTO commentDTO) {
        Long id = commentDTO.getId();
        commentService.updateDislikes(id);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return commentDTOList;
    }
}
