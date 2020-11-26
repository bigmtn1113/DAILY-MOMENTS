package com.mycompany.webapp.service;

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

	public void join(Member member) {
		memberDao.insert(member);
	}
}
