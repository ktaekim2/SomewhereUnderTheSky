package com.its.somewhereUnderTheSky.dto;

import lombok.Data;

@Data
public class PassengerDTO {
    private Long id;
    private String passengerLastName;
    private String passengerFirstName;
    private String passengerGender;
    private String passengerBirthdate;
    private Long bookId;
}
