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
		int rows = sst.insert("mybatis.mapper.board.insert", board);
		return rows;
	}

	public int getMemberBcnt(String mid) {
		int memberBcnt = sst.selectOne("mybatis.mapper.board.selectMemberBcnt", mid);
		return memberBcnt;
	}

	public List<String> getMemberBphoto(String mid) {
		List<String> memberBphotos = sst.selectList("mybatis.mapper.board.selectMemberBphoto", mid);
		return memberBphotos;
	}
}
