package com.its.somewhereUnderTheSky.controller;

import com.its.somewhereUnderTheSky.dto.BookDTO;
import com.its.somewhereUnderTheSky.dto.FlightDTO;
import com.its.somewhereUnderTheSky.service.BookService;
import com.its.somewhereUnderTheSky.service.FlightService;
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
    @Autowired
    private FlightService flightService;

    @GetMapping("/search")
    public String search() {
        return "/bookPages/search";
    }

    @PostMapping("/search")
    public String search(@ModelAttribute FlightDTO flightDTO, BookDTO bookDTO, Model model) {
        System.out.println("BookController.search");
        System.out.println("flightDTO = " + flightDTO + ", bookDTO = " + bookDTO + ", model = " + model);

        // 해당 날짜의 컬럼들을 model
        String departureDate = flightDTO.getDepartureDate();
        model.addAttribute("departureDate", departureDate);
        String departureAirport = flightDTO.getDepartureAirport();
        model.addAttribute("departureAirport", departureAirport);
        String arrivalAirport = flightDTO.getArrivalAirport();
        model.addAttribute("arrivalAirport", arrivalAirport);
        String returnDate = bookDTO.getReturnDate();
        model.addAttribute("returnDate", returnDate);

        // passenger 정보와 cabinClass를 저장하고 bookId를 return받기위해 save
        Long bookId = bookService.save(bookDTO);
        System.out.println("bookId = " + bookId);
        model.addAttribute("bookId", bookId);

        // 출/도착 공항, 출발날짜가 동일한 여행권을 리스트로 뽑아옴
//        List<FlightDTO> flightDTOList = bookService.findByDate(flightDTO);
//        model.addAttribute("flightList", flightDTOList);

        return "/bookPages/departure";
    }

    // departure.jsp에서 ajax로 해당날짜 항공편리스트를 뽑아오기 위한 메서드
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
    public String payment(@RequestParam("bookId") Long bookId, @RequestParam("flightId") Long flightId, Model model) {
        System.out.println("BookController.payment");
        System.out.println("bookId = " + bookId + ", flightId = " + flightId);

        // bookDTO
        BookDTO bookDTO = bookService.findById(bookId);
        System.out.println("bookDTO = " + bookDTO);

//        String returnDate = bookDTO.getReturnDate();
//        model.addAttribute("returnDate", returnDate);

        // model
//        model.addAttribute("book", bookDTO);
//        model.addAttribute("flight", flightDTO);
//        model.addAttribute("flightList", flightDTOList);

        if (bookDTO.getReturnDate().equals("1991-09-24 00:00:00")) {
            System.out.println("편도");

            // departureFlightDTO
            FlightDTO departureFlightDTO = flightService.findById(flightId);
            System.out.println("departureFlightDTO = " + departureFlightDTO);
            model.addAttribute("departureFlight", departureFlightDTO);

            // bookDTO
            model.addAttribute("book", bookDTO);

            return "/bookPages/payment";
        } else {
            System.out.println("왕복");

            // flightDTO
            FlightDTO flightDTO = flightService.findById(flightId);
            System.out.println("flightDTO = " + flightDTO);

            // 돌아오는 날짜와 공항을 출발 날짜와 공항으로 바꿈
            flightDTO.setDepartureDate(bookDTO.getReturnDate());
            String temp = flightDTO.getDepartureAirport();
            flightDTO.setDepartureAirport(flightDTO.getArrivalAirport());
            flightDTO.setArrivalAirport(temp);
//        List<FlightDTO> flightDTOList = bookService.search(flightDTO);

            // 해당 날짜의 컬럼들을 model
            String departureDate = flightDTO.getDepartureDate();
            model.addAttribute("departureDate", departureDate);
            String departureAirport = flightDTO.getDepartureAirport();
            model.addAttribute("departureAirport", departureAirport);
            String arrivalAirport = flightDTO.getArrivalAirport();
            model.addAttribute("arrivalAirport", arrivalAirport);

            // bookId를 다음 컨트롤러로 가져가기 위해 model
            model.addAttribute("bookId", bookId);

            // departureFlightId를 다음 컨트롤러로 가져가기 위해 model
            model.addAttribute("departureFlightId", flightId);

            return "/bookPages/return";
        }
    }

    @GetMapping("/returnPayment")
    public String returnPayment(@RequestParam("bookId") Long bookId, @RequestParam("departureFlightId") Long departureFlightId, @RequestParam("returnFlightId") Long returnFlightId, Model model) {
        System.out.println("BookController.returnPayment");
        System.out.println("bookId = " + bookId + ", returnFlightId = " + returnFlightId + ", departureFlightId = " + departureFlightId + ", model = " + model);

        // bookDTO
        BookDTO bookDTO = bookService.findById(bookId);
        System.out.println("bookDTO = " + bookDTO);
        model.addAttribute("book", bookDTO);

        // departureFlightDTO
        FlightDTO departureFlightDTO = flightService.findById(departureFlightId);
        System.out.println("departureFlightDTO = " + departureFlightDTO);
        model.addAttribute("departureFlight", departureFlightDTO);

        // returnFlightDTO
        FlightDTO returnFlightDTO = flightService.findById(returnFlightId);
        System.out.println("returnFlightDTO = " + returnFlightDTO);
        model.addAttribute("returnFlight", returnFlightDTO);

        return "/bookPages/payment";
    }
}
