package com.its.somewhereUnderTheSky.controller;

import com.its.somewhereUnderTheSky.dto.BookDTO;
import com.its.somewhereUnderTheSky.dto.FlightDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book")
public class BookController {

    @GetMapping("/search")
    public String search() {
        return "/bookPages/search";
    }

    @PostMapping("/search")
    public String search(@ModelAttribute FlightDTO flightDTO, BookDTO bookDTO) {
        System.out.println("BookController.search");
        System.out.println("flightDTO = " + flightDTO + ", bookDTO = " + bookDTO);
        return null;
    }
}
