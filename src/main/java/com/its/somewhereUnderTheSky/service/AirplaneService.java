package com.its.somewhereUnderTheSky.service;

import com.its.somewhereUnderTheSky.dto.AirplaneDTO;
import com.its.somewhereUnderTheSky.repository.AirplaneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class AirplaneService {
    @Autowired
    private AirplaneRepository airplaneRepository;

    public List<AirplaneDTO> findAll() {
        return airplaneRepository.findAll();
    }

    public void save(AirplaneDTO airplaneDTO) throws IOException {
        MultipartFile airplaneFile = airplaneDTO.getAirplaneFile();
        String airplaneFileName = airplaneFile.getOriginalFilename();
        airplaneFileName = System.currentTimeMillis() + "-" + airplaneFileName;
        airplaneDTO.setAirplaneFileName(airplaneFileName);
        String savePath = "D:\\spring_img\\" + airplaneFileName;
        if (!airplaneFile.isEmpty()) {
            airplaneFile.transferTo(new File(savePath));
        }
        airplaneRepository.save(airplaneDTO);
    }

    public AirplaneDTO findById(Long id) {
        return airplaneRepository.findById(id);
    }
}
