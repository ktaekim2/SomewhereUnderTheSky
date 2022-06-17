package com.its.somewhereUnderTheSky.dto;

import lombok.Data;

@Data
public class MemberDTO {
    private Long id;
    private String memberAccount;
    private String memberPassword;
    private String memberLastName;
    private String memberFirstName;
    private String memberPassportNumber;
    private String memberBirthdate;
    private String memberGender;
    private String memberEmail;
    private String memberNation;
    private String memberPhone;
}
