package com.its.somewhereUnderTheSky.repository;

import com.its.somewhereUnderTheSky.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(MemberDTO memberDTO) {
        System.out.println("MemberRepository.save");
        System.out.println("memberDTO = " + memberDTO);
        sql.insert("Member.save", memberDTO);
    }

    public String duplicateCheck(String memberAccount) {
        return sql.selectOne("Member.duplicateCheck", memberAccount);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }
}
