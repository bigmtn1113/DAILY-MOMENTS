package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.BookmarkDao;
import com.mycompany.webapp.dao.CommentDao;
import com.mycompany.webapp.dao.FollowDao;
import com.mycompany.webapp.dao.LikeDao;
import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Member;

@Service
public class WebService {
	
	private static final Logger logger=LoggerFactory.getLogger(WebService.class);
	
	@Resource
	private BoardDao boardDao;
	
	@Resource
	private BookmarkDao bookmarkDao;
	
	@Resource
	private CommentDao commentDao;
	
	@Resource
	private FollowDao followDao;
	
	@Resource
	private LikeDao likeDao;
	
	@Resource
	private MemberDao memberDao;

	public void write(Board board) {
		boardDao.write(board);
	}

	public Member getMember(String mid) {
		Member member = memberDao.getMember(mid);
		return member;
	}
	
	public int getMemberBcnt(String mid) {
		int memberBcnt = boardDao.getMemberBcnt(mid);
		return memberBcnt;
	}

	public List<String> getMemberBphoto(String mid) {
		List<String> memberBphotos = boardDao.getMemberBphoto(mid);
		return memberBphotos;
	}

	public int getFollowerCnt(String mid) {
		int followerCnt = followDao.getFollowerCnt(mid);
		return followerCnt;
	}
	
	public int getFollowingCnt(String mid) {
		int followingCnt = followDao.getFollowingCnt(mid);
		return followingCnt;
	}
}
