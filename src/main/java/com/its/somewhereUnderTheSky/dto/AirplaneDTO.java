package com.its.somewhereUnderTheSky.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class AirplaneDTO {
    private Long id;
    private String airplaneModel;
    private int airplaneMaxSeats;
    private String airplaneStatus;
    private MultipartFile airplaneFile;
    private String airplaneFileName;
}
