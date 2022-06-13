package com.its.somewhereUnderTheSky.service;

import com.its.somewhereUnderTheSky.dto.FlightDTO;
import com.its.somewhereUnderTheSky.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {
    @Autowired
    private BookRepository bookRepository;

    public List<FlightDTO> search(FlightDTO flightDTO) {
        return bookRepository.search(flightDTO);
    }

    public List<FlightDTO> findByDate(FlightDTO flightDTO) {
        return bookRepository.findByDate(flightDTO);
    }
}
