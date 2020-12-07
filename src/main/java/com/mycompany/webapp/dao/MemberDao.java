package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Member;

@Repository
public class MemberDao {
	
	@Resource private SqlSessionTemplate sst;

	public int insert(Member member) {
		int row = sst.insert("mybatis.mapper.member.insert",member);
		return row;
	}
	
	public Member selectMember(String searchedId) {
		Member member = sst.selectOne("mybatis.mapper.member.selectMember", searchedId);
		return member;
	}
	
	public int updateMember(Member member) {
		int rows = sst.update("mybatis.mapper.member.updateMember", member);
		return rows;
	}
	
	public int updateMemberExcludeImage(Member member) {
		int rows = sst.update("mybatis.mapper.member.updateMemberExcludeImage", member);
		return rows;
	}

	public String selectMid(String searchedId) {
		String mid = sst.selectOne("mybatis.mapper.member.selectMid", searchedId);
		return mid;
	}

	public String selectMphoto(String mid) {
		String mphoto = sst.selectOne("mybatis.mapper.member.selectMphoto", mid);
		return mphoto;
	}
}
