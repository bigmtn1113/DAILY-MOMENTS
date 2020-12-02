package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Tag;

@Repository
public class TagDao {
	
	@Resource private SqlSessionTemplate sst;

	public int insert(Tag tag) {
		int rows = sst.insert("mybatis.mapper.tag.insert", tag);
		return rows;
	}
	
	public String selectTag(String searchedTag) {
		String tag = sst.selectOne("mybatis.mapper.tag.selectTag", searchedTag);
		return tag;
	}
	
	public int selectTagBoardCnt(String tname) {
		int tagBoardCnt = sst.selectOne("mybatis.mapper.tag.selectTagBoardCnt", tname);
		return tagBoardCnt;
	}
}
