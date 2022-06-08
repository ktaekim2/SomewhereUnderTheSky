package com.its.somewhereUnderTheSky.repository;

import com.its.somewhereUnderTheSky.dto.AirplaneDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AirplaneRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<AirplaneDTO> findAll() {
        return sql.selectList("Airplane.findAll");
    }

    public void save(AirplaneDTO airplaneDTO) {
        sql.insert("Airplane.save", airplaneDTO);
    }

    public AirplaneDTO findById(Long id) {
        return sql.selectOne("Airplane.findById", id);
    }
}
