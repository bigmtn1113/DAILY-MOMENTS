package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BookmarkDao;

@Service
public class BookmarkService {
	@Resource private BookmarkDao bookmarkDao;
	
	
}
