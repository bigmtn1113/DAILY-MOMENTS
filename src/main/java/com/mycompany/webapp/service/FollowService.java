package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.FollowDao;
import com.mycompany.webapp.dto.Follow;

@Service
public class FollowService {
	@Resource private FollowDao followDao;
	
	public List<String> getFollowingMembers(String mid) {
		List<String> followingMembers = followDao.selectFollowingMembers(mid);
		return followingMembers;
	}
	
	public int getFollowerCnt(String mid) {
		int followerCnt = followDao.selectFollowerCnt(mid);
		return followerCnt;
	}
	
	public int getFollowingCnt(String mid) {
		int followingCnt = followDao.selectFollowingCnt(mid);
		return followingCnt;
	}

	public void insert(Follow follow) {
		followDao.insert(follow);
	}

	public void delete(Follow follow) {
		followDao.delete(follow);
	}

	public List<String> getFollowerID(String mid) {
		List<String> followerIDs = followDao.selectFollowerID(mid);
		return followerIDs;
	}

	public List<String> getFollowingID(String mid) {
		List<String> followingIDs = followDao.selectFollowingID(mid);
		return followingIDs;
	}

	public String getFollowerPhotos(String followerID) {
		String followerPhoto = followDao.selectFollowerPhoto(followerID);
		return followerPhoto;
	}

	public String getFollowingPhotos(String followingID) {
		String followingPhoto = followDao.selectFollowingPhoto(followingID);
		return followingPhoto;
	}
}
