package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.TagDao;
import com.mycompany.webapp.dto.Tag;

@Service
public class TagService {
	@Resource private TagDao tagDao;

	public void insert(Tag tag) {
		tagDao.insert(tag);
	}
	
	public void delete(Tag tag) {
		tagDao.delete(tag);
	}
	
	public String getTag(String searchedTag) {
		String tag = tagDao.selectTag(searchedTag);
		return tag;
	}
	
	public int getTagBoardCnt(String tname) {
		int tagBoardCnt = tagDao.selectTagBoardCnt(tname);
		return tagBoardCnt;
	}
}
