package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BlikeDao;

@Service
public class BlikeService {
	@Resource private BlikeDao blikeDao;
	
	public Integer getLikeCnt(int bno) {
		Integer likeCnt = blikeDao.selectLikeCnt(bno);
		return likeCnt;
	}
}
