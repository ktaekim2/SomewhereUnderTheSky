package com.its.somewhereUnderTheSky.dto;

import lombok.Data;

@Data
public class FlightDTO {
    private Long id;
    private String flightNumber;
    private String flightAirline;
    private Long airplaneId;
    private String departureAirport;
    private String arrivalAirport;
    private String departureDate;
    private String arrivalDate;
    private int gateNumber;
    private Long flightFare;
}
