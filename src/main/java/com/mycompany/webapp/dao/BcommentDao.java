package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Bcomment;

@Repository
public class BcommentDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public List<Bcomment> getBoardComments(int bno) {
		List<Bcomment> boardComments = sst.selectList("mybatis.mapper.bcomment.selectBoardComments", bno);
		return boardComments;
	}
}
