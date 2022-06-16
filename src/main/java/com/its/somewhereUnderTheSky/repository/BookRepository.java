package com.its.somewhereUnderTheSky.repository;

import com.its.somewhereUnderTheSky.dto.BookDTO;
import com.its.somewhereUnderTheSky.dto.FlightDTO;
import com.its.somewhereUnderTheSky.dto.PassengerDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<FlightDTO> search(FlightDTO flightDTO) {
        return sql.selectList("Flight.search", flightDTO);
    }

    public List<FlightDTO> findByDate(FlightDTO flightDTO) {
        return sql.selectList("Flight.findByDate", flightDTO);
    }

    public Long save(BookDTO bookDTO) {
        sql.insert("Book.save", bookDTO);
        Long bookId = bookDTO.getId();
        return bookId;
    }

    public BookDTO findById(Long bookId) {
        return sql.selectOne("Book.findById", bookId);
    }

    public void passengerSave(PassengerDTO passengerDTO) {
        sql.insert("Book.passengerSave", passengerDTO);
    }
}
