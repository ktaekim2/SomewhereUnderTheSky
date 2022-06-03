package com.its.somewhereUnderTheSky.service;

import com.its.somewhereUnderTheSky.dto.MemberDTO;
import com.its.somewhereUnderTheSky.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) {
        System.out.println("MemberService.save");
        System.out.println("memberDTO = " + memberDTO);
        memberRepository.save(memberDTO);
    }
}
