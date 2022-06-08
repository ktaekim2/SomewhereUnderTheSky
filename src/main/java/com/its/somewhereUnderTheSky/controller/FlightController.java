package com.its.somewhereUnderTheSky.controller;

import com.its.somewhereUnderTheSky.dto.FlightDTO;
import com.its.somewhereUnderTheSky.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/flight")
public class FlightController {
    @Autowired
    private FlightService flightService;

    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<FlightDTO> flightDTOList = flightService.findAll();
        model.addAttribute("flightList", flightDTOList);
        return "/flightPlages/flightList";
    }

    @GetMapping("/save")
    public String saveForm() {
        return "/flightPlages/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute FlightDTO flightDTO) {
        flightService.save(flightDTO);
        return "redirect:/flight/findAll";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        FlightDTO flightDTO = flightService.findById(id);
        model.addAttribute("flight", flightDTO);
        return "/flightPlages/detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        flightService.delete(id);
        return "redirect:/flight/findAll";
    }

    @GetMapping("/update")
    public String update(@RequestParam("id") Long id, Model model) {
        FlightDTO flightDTO = flightService.findById(id);
        model.addAttribute("flight", flightDTO);
        return "/flightPlages/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute FlightDTO flightDTO) {
        flightService.update(flightDTO);
        return "redirect:/flight/findAll";
    }
}
