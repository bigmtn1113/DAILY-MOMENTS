package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.mycompany.webapp.dto.Member;

@Repository
public class MemberDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public Member getMember(String mid) {
		Member member = sst.selectOne("mybatis.mapper.member.selectMember", mid);
		return member;
	}
}
