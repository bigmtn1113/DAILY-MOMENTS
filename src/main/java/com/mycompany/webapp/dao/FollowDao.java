package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Follow;

@Repository
public class FollowDao {
	
	@Resource private SqlSessionTemplate sst;

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

	public List<String> selectFollowerID(String mid) {
		List<String> followerIDs = sst.selectList("mybatis.mapper.follow.selectFollowerID", mid);
		return followerIDs;
	}

	public List<String> selectFollowingID(String mid) {
		List<String> followingIDs = sst.selectList("mybatis.mapper.follow.selectFollowingID", mid);
		return followingIDs;
	}

	public String selectFollowerPhoto(String followerID) {
		String followerPhoto = sst.selectOne("mybatis.mapper.follow.selectFollowerPhoto", followerID);
		return followerPhoto;
	}

	public String selectFollowingPhoto(String followingID) {
		String followingPhoto = sst.selectOne("mybatis.mapper.follow.selectFollowingPhoto", followingID);
		return followingPhoto;
	}
}
