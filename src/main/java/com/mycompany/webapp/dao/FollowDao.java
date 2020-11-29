package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FollowDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public int selectFollowerCnt(String mid) {
		int followerCnt = sst.selectOne("mybatis.mapper.follow.selectFollowerCnt", mid);
		return followerCnt;
	}

	public int selectFollowingCnt(String mid) {
		int followingCnt = sst.selectOne("mybatis.mapper.follow.selectFollowingCnt", mid);
		return followingCnt;
	}
}
