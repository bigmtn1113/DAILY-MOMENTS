package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.FollowDao;

@Service
public class FollowService {
	private static final Logger logger=LoggerFactory.getLogger(FollowService.class);
	
	@Resource
	private FollowDao followDao;
	
	public int getFollowerCnt(String mid) {
		int followerCnt = followDao.getFollowerCnt(mid);
		return followerCnt;
	}
	
	public int getFollowingCnt(String mid) {
		int followingCnt = followDao.getFollowingCnt(mid);
		return followingCnt;
	}
}
