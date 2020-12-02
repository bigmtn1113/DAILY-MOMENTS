package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Blike;

@Repository
public class BlikeDao {

	@Resource
	private SqlSessionTemplate sst;

	public Integer selectLikeCnt(int bno) {
		Integer likeCnt = sst.selectOne("mybatis.mapper.blike.selectLikeCnt", bno);
		return likeCnt;
	}

	public Blike getLikes(int bno) {
		Blike blike = sst.selectOne("mybatis.mapper.blike.selectLike", bno);
		return blike;
	}
}
