package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.Member;

@Service
public class MemberService {
	private static final Logger logger=LoggerFactory.getLogger(MemberService.class);
	
	@Resource
	private MemberDao memberDao;

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
