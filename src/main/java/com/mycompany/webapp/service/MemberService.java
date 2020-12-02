package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.Member;

@Service
public class MemberService {
	@Resource private MemberDao memberDao;

	public void join(Member member) {
		memberDao.insert(member);
	}
	
	public Member getMember(String searchedId) {
		Member member = memberDao.selectMember(searchedId);
		return member;
	}
	
	public void memberUpdate(Member member) {
		memberDao.updateMember(member);
	}

	public String getMid(String searchedId) {
		String mid = memberDao.selectMid(searchedId);
		return mid;
	}
}
