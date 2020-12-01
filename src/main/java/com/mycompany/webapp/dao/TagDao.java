package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TagDao {
	
	@Resource private SqlSessionTemplate sst;

	public int selectTagBoardCnt(String tname) {
		int tagBoardCnt = sst.selectOne("mybatis.mapper.tag.selectTagBoardCnt", tname);
		return tagBoardCnt;
	}

	public String selectTag(String searchedTag) {
		String tag = sst.selectOne("mybatis.mapper.tag.selectTag", searchedTag);
		return tag;
	}
}
