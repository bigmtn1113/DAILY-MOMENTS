package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Blike;

@Repository
public class BlikeDao {

	@Resource private SqlSessionTemplate sst;

	public Integer selectLikeCnt(int bno) {
		Integer likeCnt = sst.selectOne("mybatis.mapper.blike.selectLikeCnt", bno);
		return likeCnt;
	}


	public List<String> selectLikeMid(Integer boardbno) {
		List<String> likeMid = sst.selectList("mybatis.mapper.blike.selectLikeMid", boardbno);
		return likeMid;
	}

}
