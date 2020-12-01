package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.TagDao;

@Service
public class TagService {
	private static final Logger logger=LoggerFactory.getLogger(BcommentService.class);
	
	@Resource
	private TagDao tagDao;

	public int getTagBoardCnt(String tname) {
		int tagBoardCnt = tagDao.selectTagBoardCnt(tname);
		return tagBoardCnt;
	}
}
