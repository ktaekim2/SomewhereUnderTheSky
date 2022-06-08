package com.its.somewhereUnderTheSky.controller;

import com.its.somewhereUnderTheSky.dto.AirplaneDTO;
import com.its.somewhereUnderTheSky.dto.BoardDTO;
import com.its.somewhereUnderTheSky.dto.MemberDTO;
import com.its.somewhereUnderTheSky.service.AirplaneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/airplane")
public class AirplaneController {

    @Autowired
    private AirplaneService airplaneService;

    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<AirplaneDTO> airplaneDTOList = airplaneService.findAll();
        model.addAttribute("airplaneList", airplaneDTOList);
        return "/airplanePages/airplaneList";
    }

    @GetMapping("/save")
    public String saveForm() {
        return "/airplanePages/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute AirplaneDTO airplaneDTO) throws IOException {
        airplaneService.save(airplaneDTO);
        return "redirect:/airplane/findAll";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        AirplaneDTO airplaneDTO = airplaneService.findById(id);
        model.addAttribute("airplane", airplaneDTO);
        return "/airplanePages/detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        airplaneService.delete(id);
        return "redirect:/airplane/findAll";
    }

    @GetMapping("/update")
    public String update(@RequestParam("id") Long id, Model model) {
        AirplaneDTO airplaneDTO = airplaneService.findById(id);
        model.addAttribute("airplane", airplaneDTO);
        return "/airplanePages/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute AirplaneDTO airplaneDTO) throws IOException {
        airplaneService.update(airplaneDTO);
        return "redirect:/airplane/findAll";
    }
}
