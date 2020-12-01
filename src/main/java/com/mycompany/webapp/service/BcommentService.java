package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BcommentDao;
import com.mycompany.webapp.dto.Bcomment;

@Service
public class BcommentService {
	private static final Logger logger=LoggerFactory.getLogger(BcommentService.class);
	
	@Resource
	private BcommentDao bcommentDao;
	
	public List<Bcomment> getBoardComments(int bno) {
		List<Bcomment> boardComments = bcommentDao.selectBoardComments(bno);
		return boardComments;
	}
	
	public void CommentsWrite(Bcomment bcomment) {
		bcommentDao.insert(bcomment);
	}

	public List<Bcomment> getBoardCommentsWrite(int bno) {
		List<Bcomment> getBoardCommentsWrite = bcommentDao.selectBoardCommentsWrite(bno);
		return getBoardCommentsWrite;
	}
}
