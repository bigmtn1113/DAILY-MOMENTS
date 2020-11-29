package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BlikeDao;

@Service
public class BlikeService {
	private static final Logger logger=LoggerFactory.getLogger(BlikeService.class);
	
	@Resource
	private BlikeDao blikeDao;
	
	public Integer getLikeCnt(int bno) {
		Integer likeCnt = blikeDao.getLikeCnt(bno);
		return likeCnt;
	}
}
