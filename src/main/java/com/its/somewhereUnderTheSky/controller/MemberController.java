package com.its.somewhereUnderTheSky.controller;

import com.its.somewhereUnderTheSky.dto.MemberDTO;
import com.its.somewhereUnderTheSky.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm() {
        return "/memberPages/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        System.out.println("MemberController.save");
        System.out.println("memberDTO = " + memberDTO);
        memberService.save(memberDTO);
        return "/memberPages/login";
    }

    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberAccount") String memberAccount) {
        System.out.println("MemberController.duplicateCheck");
        System.out.println("memberAccount = " + memberAccount);
        String checkResult = memberService.duplicateCheck(memberAccount);
        System.out.println("checkResult = " + checkResult);
        return checkResult;
    }

    @GetMapping("/login")
    public String loginForm() {
        return "/memberPages/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        MemberDTO loginMember = memberService.login(memberDTO);
        System.out.println("loginMember = " + loginMember);
        if (loginMember != null) {
            System.out.println("로그인 성공");
            session.setAttribute("loginMemberId", loginMember.getMemberAccount());
            session.setAttribute("loginId", loginMember.getId());
            return "index";
        } else {
            System.out.println("로그인 실패");
            return "/memberPages/login";
        }
    }
}
