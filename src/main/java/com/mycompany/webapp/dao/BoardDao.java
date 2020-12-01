package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Board;

@Repository
public class BoardDao {
	
	@Resource private SqlSessionTemplate sst;

	public int insert(Board board) {
		int rows = sst.insert("mybatis.mapper.board.insert", board);
		return rows;
	}
	
	public int selectBno(String saveFileName) {
		int bno = sst.selectOne("mybatis.mapper.board.selectBno", saveFileName);
		return bno;
	}

	public int selectMemberBcnt(String mid) {
		int memberBcnt = sst.selectOne("mybatis.mapper.board.selectMemberBcnt", mid);
		return memberBcnt;
	}

	public List<String> selectMemberBphotos(String mid) {
		List<String> memberBphotos = sst.selectList("mybatis.mapper.board.selectMemberBphotos", mid);
		return memberBphotos;
	}

	public List<Board> selectBoards(String mid) {
		List<Board> boards = sst.selectList("mybatis.mapper.board.selectBoards", mid);
		return boards;
	}

	public List<String> selectTagBoardPhotos(String tname) {
		List<String> tagBoardPhotos = sst.selectList("mybatis.mapper.board.selectTagBoardPhotos", tname);
		return tagBoardPhotos;
	}
}
