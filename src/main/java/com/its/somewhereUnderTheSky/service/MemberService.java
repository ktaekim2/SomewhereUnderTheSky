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

    public String duplicateCheck(String memberAccount) {
        System.out.println("MemberService.duplicateCheck");
        System.out.println("memberAccount = " + memberAccount);
        String checkResult = memberRepository.duplicateCheck(memberAccount);
        System.out.println("checkResult = " + checkResult);
        if (checkResult == null) // 중복 아이디가 select해서 존재하지 않기 때문에 null 리턴
            return "ok";
        else
            return "no";
    }

    public MemberDTO login(MemberDTO memberDTO) {
        System.out.println("MemberService.login");
        System.out.println("memberDTO = " + memberDTO);

        return memberRepository.login(memberDTO);
    }
}
