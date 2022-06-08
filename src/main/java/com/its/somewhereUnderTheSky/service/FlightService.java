package com.its.somewhereUnderTheSky.service;

import com.its.somewhereUnderTheSky.dto.FlightDTO;
import com.its.somewhereUnderTheSky.repository.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlightService {
    @Autowired
    private FlightRepository flightRepository;

    public List<FlightDTO> findAll() {
        return flightRepository.findAll();
    }

    public void save(FlightDTO flightDTO) {
        flightRepository.save(flightDTO);
    }

    public FlightDTO findById(Long id) {
        return flightRepository.findById(id);
    }

    public void delete(Long id) {
        flightRepository.delete(id);
    }

    public void update(FlightDTO flightDTO) {
        flightRepository.update(flightDTO);
    }
}
