package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BcommentDao;
import com.mycompany.webapp.dto.Bcomment;

@Service
public class BcommentService {
	@Resource private BcommentDao bcommentDao;
	
	public List<Bcomment> getBcomments(int bno) {
		List<Bcomment> bcomments = bcommentDao.selectBcomments(bno);
		return bcomments;
	}
	
	public void CommentsWrite(Bcomment bcomment) {
		bcommentDao.insert(bcomment);
	}

	public List<Bcomment> getBoardCommentsWrite(int bno) {
		List<Bcomment> getBoardCommentsWrite = bcommentDao.selectBoardCommentsWrite(bno);
		return getBoardCommentsWrite;
	}
}
