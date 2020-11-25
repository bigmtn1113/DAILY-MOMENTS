package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FollowDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public int getFollowerCnt(String mid) {
		int followerCnt = sst.selectOne("mybatis.mapper.follow.selectFollowerCnt", mid);
		return followerCnt;
	}

	public int getFollowingCnt(String mid) {
		int followingCnt = sst.selectOne("mybatis.mapper.follow.selectFollowingCnt", mid);
		return followingCnt;
	}
}
