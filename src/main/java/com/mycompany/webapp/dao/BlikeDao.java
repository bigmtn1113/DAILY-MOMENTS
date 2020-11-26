package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BlikeDao {

	@Resource
	private SqlSessionTemplate sst;

	public Integer getLikeCnt(int bno) {
		Integer likeCnt = sst.selectOne("mybatis.mapper.blike.selectLikeCnt", bno);
		return likeCnt;
	}
}
