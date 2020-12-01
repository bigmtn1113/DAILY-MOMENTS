package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Follow;

@Repository
public class FollowDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public List<String> selectFollowingMembers(String mid) {
		List<String> followingMembers = sst.selectList("mybatis.mapper.follow.selectFollowingMembers", mid);
		return followingMembers;
	}
	
	public int selectFollowerCnt(String mid) {
		int followerCnt = sst.selectOne("mybatis.mapper.follow.selectFollowerCnt", mid);
		return followerCnt;
	}

	public int selectFollowingCnt(String mid) {
		int followingCnt = sst.selectOne("mybatis.mapper.follow.selectFollowingCnt", mid);
		return followingCnt;
	}

	public int insert(Follow follow) {
		int rows = sst.insert("mybatis.mapper.follow.insert", follow);
		return rows;
	}

	public int delete(Follow follow) {
		int rows = sst.delete("mybatis.mapper.follow.delete", follow);
		return rows;
	}
}
