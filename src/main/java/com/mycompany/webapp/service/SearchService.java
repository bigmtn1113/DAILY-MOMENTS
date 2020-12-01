package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.Member;

@Service
public class SearchService {
	private static final Logger logger=LoggerFactory.getLogger(SearchService.class);
	
	@Resource
	private MemberDao memberDao;
	
	public String compareMid(String searchedId) {
		String compareMid = memberDao.selectMid(searchedId);
		return compareMid;
	}
}
