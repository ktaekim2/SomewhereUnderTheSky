package com.its.somewhereUnderTheSky.controller;

import com.its.somewhereUnderTheSky.dto.BookDTO;
import com.its.somewhereUnderTheSky.dto.FlightDTO;
import com.its.somewhereUnderTheSky.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping("/search")
    public String search() {
        return "/bookPages/search";
    }

    @PostMapping("/search")
    public String search(@ModelAttribute FlightDTO flightDTO, BookDTO bookDTO, Model model) {
        System.out.println("BookController.search");
        System.out.println("flightDTO = " + flightDTO + ", bookDTO = " + bookDTO);

        List<FlightDTO> flightDTOList1 = bookService.search(flightDTO);
        model.addAttribute("departureFlight", flightDTOList1);

        flightDTO.setDepartureDate(bookDTO.getReturnDate());
        String temp = flightDTO.getDepartureAirport();
        flightDTO.setDepartureAirport(flightDTO.getArrivalAirport());
        flightDTO.setArrivalAirport(temp);
        List<FlightDTO> flightDTOList2 = bookService.search(flightDTO);
        model.addAttribute("returnFlight", flightDTOList2);

        return "/bookPages/calendar-fare";
    }
}
