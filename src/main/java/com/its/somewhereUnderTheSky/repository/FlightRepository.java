package com.its.somewhereUnderTheSky.repository;

import com.its.somewhereUnderTheSky.dto.AirplaneDTO;
import com.its.somewhereUnderTheSky.dto.FlightDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FlightRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<FlightDTO> findAll() {
        return sql.selectList("Flight.findAll");
    }

    public void save(FlightDTO flightDTO) {
        sql.insert("Flight.save", flightDTO);
    }

    public FlightDTO findById(Long id) {
        return sql.selectOne("Flight.findById", id);
    }

    public void delete(Long id) {
        sql.delete("Flight.delete", id);
    }

    public void update(FlightDTO flightDTO) {
        sql.update("Flight.update", flightDTO);
    }
}

