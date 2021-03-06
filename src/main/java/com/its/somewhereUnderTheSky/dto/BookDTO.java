package com.its.somewhereUnderTheSky.dto;

import lombok.Data;


@Data
public class BookDTO {
    private Long id;
    private Long memberId;
    private Long departureFlightId;
    private Long returnFlightId;
    private int passengerAdult;
    private int passengerChild;
    private int passengerInfant;
    private String cabinClass;
    private String seatNumber;
    private String returnDate;
    private Long paymentId;
}
