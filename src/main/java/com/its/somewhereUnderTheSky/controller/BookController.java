package com.its.somewhereUnderTheSky.controller;

import com.its.somewhereUnderTheSky.dto.BookDTO;
import com.its.somewhereUnderTheSky.dto.FlightDTO;
import com.its.somewhereUnderTheSky.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

        String departureDate = flightDTO.getDepartureDate();
        model.addAttribute("departureDate", departureDate);
        String departureAirport = flightDTO.getDepartureAirport();
        model.addAttribute("departureAirport", departureAirport);
        String arrivalAirport = flightDTO.getArrivalAirport();
        model.addAttribute("arrivalAirport", arrivalAirport);
        String returnDate = bookDTO.getReturnDate();
        model.addAttribute("returnDate", returnDate);

        List<FlightDTO> flightDTOList = bookService.findByDate(flightDTO);
        model.addAttribute("departFlight", flightDTOList);
        
//        flightDTO.setDepartureDate(bookDTO.getReturnDate());
//        String temp = flightDTO.getDepartureAirport();
//        flightDTO.setDepartureAirport(flightDTO.getArrivalAirport());
//        flightDTO.setArrivalAirport(temp);
//        List<FlightDTO> flightDTOList2 = bookService.search(flightDTO);
//        model.addAttribute("returnFlight", flightDTOList2);

        return "/bookPages/departure";
    }

    @GetMapping("/findByDate")
    public @ResponseBody List<FlightDTO> findByDate(@ModelAttribute FlightDTO flightDTO) {
        System.out.println("BookController.findByDate");
        System.out.println("flightDTO = " + flightDTO);
        List<FlightDTO> flightDTOList = bookService.findByDate(flightDTO);
        for (FlightDTO b : flightDTOList) {
            System.out.println("for문 동작");
            System.out.println(b);
        }
        return flightDTOList;
    }
}
