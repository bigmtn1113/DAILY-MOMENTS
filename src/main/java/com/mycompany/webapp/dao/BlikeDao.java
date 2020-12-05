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

	public int insertLikeClick(Blike blike) {
		int rows=sst.insert("mybatis.mapper.blike.insert",blike);
		return rows;
	}

	public int deleteLikeClick(Blike blike) {
		int rows=sst.insert("mybatis.mapper.blike.delete",blike);
		return rows;
	}

	public List<Blike> selectBlikes(String mid) {
		List<Blike> blikes = sst.selectList("mybatis.mapper.blike.selectLikes", mid);
		return blikes;
	}

	public int countLikeClick(int bno) {
		int rows=sst.selectOne("mybatis.mapper.blike.countLikeClick",bno);
		return rows;
	}

	public int selectLikeClickCheck(Blike blike) {
		int likeClick = sst.selectOne("mybatis.mapper.blike.selectLikeClickCheck", blike);
		return likeClick;
	}
}
