package com.its.somewhereUnderTheSky.repository;

import com.its.somewhereUnderTheSky.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);
    }

    public void delete(Long id) {
        sql.delete("Member.delete", id);
    }
}
