package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Board;

@Repository
public class BoardDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public int write(Board board) {
		int rows = sst.insert("mybatis.mapper.board.insertBoard", board);
		return rows;
	}

	public int getMemberBcnt(String mid) {
		int memberBcnt = sst.selectOne("mybatis.mapper.board.selectMemberBcnt", mid);
		return memberBcnt;
	}

	public List<String> getMemberBphotos(String mid) {
		List<String> memberBphotos = sst.selectList("mybatis.mapper.board.selectMemberBphotos", mid);
		return memberBphotos;
	}

	public List<Board> getBoards(String mid) {
		List<Board> boards = sst.selectList("mybatis.mapper.board.selectBoards", mid);
		return boards;
	}
}
