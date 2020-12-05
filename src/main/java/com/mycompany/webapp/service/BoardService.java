package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dto.Board;

@Service
public class BoardService {
	@Resource private BoardDao boardDao;
	
	public void write(Board board) {
		boardDao.insert(board);
	}
	
	public int getBno(String saveFileName) {
		int bno = boardDao.selectBno(saveFileName);
		return bno;
	}

	public int getMemberBcnt(String mid) {
		int memberBcnt = boardDao.selectMemberBcnt(mid);
		return memberBcnt;
	}
	
	public int getMemberBMcnt(String mid) {
		int memberBMcnt = boardDao.selectMemberBMcnt(mid);
		return memberBMcnt;
	}

	public List<String> getMemberBphotos(String mid) {
		List<String> memberBphotos = boardDao.selectMemberBphotos(mid);
		return memberBphotos;
	}
	
	public List<Board> getMBAndMBMs(String mid) {
		List<Board> mbAndMBMs = boardDao.selectMBAndMBMs(mid);
		return mbAndMBMs;
	}

	public List<Board> getBoards(String mid) {
		List<Board> boards = boardDao.selectBoards(mid);
		return boards;
	}

	public List<String> getTagBoardPhotos(String tname) {
		List<String> tagBoardPhotos = boardDao.selectTagBoardPhotos(tname);
		return tagBoardPhotos;
	}

	public Board getBphoto(String bphotoName) {
		Board board = boardDao.selectBphotoName(bphotoName);
		return board;
	}
}
