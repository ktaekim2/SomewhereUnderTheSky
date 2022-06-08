package com.its.somewhereUnderTheSky.controller;

import com.its.somewhereUnderTheSky.dto.AirplaneDTO;
import com.its.somewhereUnderTheSky.dto.MemberDTO;
import com.its.somewhereUnderTheSky.service.AirplaneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

//    @GetMapping("/save")
//    public String saveForm() {
//        return "/memberPages/save";
//    }
//
//    @PostMapping("/save")
//    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
//        System.out.println("MemberController.save");
//        System.out.println("memberDTO = " + memberDTO);
//        memberService.save(memberDTO);
//        return "/memberPages/login";
//    }
}
