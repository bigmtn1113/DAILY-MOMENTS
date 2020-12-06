package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BlikeDao;
import com.mycompany.webapp.dto.Blike;

@Service
public class BlikeService {
	@Resource private BlikeDao blikeDao;
	
	public Integer getLikeCnt(int bno) {
		Integer likeCnt = blikeDao.selectLikeCnt(bno);
		return likeCnt;
	}

	public int likeClick(Blike blike) {
		int rows=blikeDao.insertLikeClick(blike);
		return rows;
	}

	public int dislikeClick(Blike blike) {
		int rows=blikeDao.deleteLikeClick(blike);
		return rows;
	}

	public List<Blike> getBlikes(String mid) {
		List<Blike> boards = blikeDao.selectBlikes(mid);
		return boards;
	}

	public int countLikes(int bno) {
		int rows=blikeDao.countLikeClick(bno);
		return rows;
	}

	public List<Blike> getLikemid(Integer boardbno) {
		List<Blike> likeMid = blikeDao.selectLikeMid(boardbno);
		return likeMid;
	}
}
