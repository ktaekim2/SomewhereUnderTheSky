package com.its.somewhereUnderTheSky.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class BookDTO {
    private Long id;
    private Long memberId;
    private Long flightId;
    private int passengerAdult;
    private int passengerChild;
    private int passengerInfant;
    private String cabinClass;
    private String seatNumber;
}
