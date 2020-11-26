package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Board;

@Repository
public class BoardDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public int insert(Board board) {
		System.out.println(board.getBcontent());
		int rows = sst.insert("mybatis.mapper.board.insert",board);
		return rows;
	}

	public int select(Board board) {
		int rows = sst.selectOne("mybatis.mapper.board.select",board);
		return rows;
	}
}
