package com.its.somewhereUnderTheSky.repository;

import com.its.somewhereUnderTheSky.dto.FlightDTO;
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
}
