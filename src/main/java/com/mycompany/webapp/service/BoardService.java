package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dto.Board;

@Service
public class BoardService {
	private static final Logger logger=LoggerFactory.getLogger(BoardService.class);
	
	@Resource
	private BoardDao boardDao;
	
	public void write(Board board) {
		boardDao.write(board);
	}

	public int getMemberBcnt(String mid) {
		int memberBcnt = boardDao.getMemberBcnt(mid);
		return memberBcnt;
	}

	public List<String> getMemberBphotos(String mid) {
		List<String> memberBphotos = boardDao.getMemberBphotos(mid);
		return memberBphotos;
	}

	public List<Board> getBoards(String mid) {
		List<Board> boards = boardDao.getBoards(mid);
		return boards;
	}
}
