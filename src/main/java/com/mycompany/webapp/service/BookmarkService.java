package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BookmarkDao;

@Service
public class BookmarkService {
	private static final Logger logger=LoggerFactory.getLogger(BookmarkService.class);
	
	@Resource
	private BookmarkDao bookmarkDao;
	
	
}
