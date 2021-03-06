package com.its.somewhereUnderTheSky.service;

import com.its.somewhereUnderTheSky.dto.BookDTO;
import com.its.somewhereUnderTheSky.dto.FlightDTO;
import com.its.somewhereUnderTheSky.dto.JoinDTO;
import com.its.somewhereUnderTheSky.dto.PassengerDTO;
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

    public Long save(BookDTO bookDTO) {
        return bookRepository.save(bookDTO);
    }

    public BookDTO findById(Long bookId) {
        return bookRepository.findById(bookId);
    }

    public void passengerSave(PassengerDTO passengerDTO) {
        bookRepository.passengerSave(passengerDTO);
    }

    public List<BookDTO> findAll() {
        return bookRepository.findAll();
    }

    public void reservation(BookDTO bookDTO) {
        bookRepository.reservation(bookDTO);
    }

    public List<JoinDTO> findAllByMemberId(Long memberId) {
        return bookRepository.findAllByMemberId(memberId);
    }
}
