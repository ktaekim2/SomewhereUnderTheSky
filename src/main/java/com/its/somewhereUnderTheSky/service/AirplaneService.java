package com.its.somewhereUnderTheSky.service;

import com.its.somewhereUnderTheSky.dto.AirplaneDTO;
import com.its.somewhereUnderTheSky.repository.AirplaneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AirplaneService {
    @Autowired
    private AirplaneRepository airplaneRepository;

    public List<AirplaneDTO> findAll() {
        return airplaneRepository.findAll();
    }
}
