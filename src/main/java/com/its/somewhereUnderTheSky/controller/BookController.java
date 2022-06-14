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
        System.out.println("BookController.search");
        System.out.println("flightDTO = " + flightDTO + ", bookDTO = " + bookDTO + ", model = " + model);

        String departureDate = flightDTO.getDepartureDate();
        model.addAttribute("departureDate", departureDate);
        String departureAirport = flightDTO.getDepartureAirport();
        model.addAttribute("departureAirport", departureAirport);
        String arrivalAirport = flightDTO.getArrivalAirport();
        model.addAttribute("arrivalAirport", arrivalAirport);
        String returnDate = bookDTO.getReturnDate();
        model.addAttribute("returnDate", returnDate);
        System.out.println("returnDate = " + returnDate);

        Long bookId = bookService.save(bookDTO);
        System.out.println("bookId = " + bookId);
        model.addAttribute("bookId", bookId);

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
    
    @GetMapping("/payment")
    public String payment(@RequestParam("bookId") Long bookId, @RequestParam("flightId") Long flightId) {
        System.out.println("BookController.payment");
        System.out.println("bookId = " + bookId + ", flightId = " + flightId);
        BookDTO bookDTO = bookService.findById(bookId);
        System.out.println("bookDTO = " + bookDTO);
        System.out.println(bookDTO.getReturnDate());
        if (bookDTO.getReturnDate().equals("1991-09-24 00:00:00")) {
            System.out.println("편도");
            return "/bookPages/payment";
        } else {
            System.out.println("왕복");
            return "/bookPages/return";
        }

    }
}
