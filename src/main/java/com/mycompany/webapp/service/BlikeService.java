package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BlikeDao;
import com.mycompany.webapp.dto.Blike;

@Service
public class BlikeService {
	private static final Logger logger=LoggerFactory.getLogger(BlikeService.class);
	
	@Resource
	private BlikeDao blikeDao;
	
	public Integer getLikeCnt(int bno) {
		Integer likeCnt = blikeDao.selectLikeCnt(bno);
		return likeCnt;
	}

	public Blike getLikes(int bno) {
		Blike blike = blikeDao.getLikes(bno);
		return blike;
	}
	
}
