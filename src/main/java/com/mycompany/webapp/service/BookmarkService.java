package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BookmarkDao;
import com.mycompany.webapp.dto.Blike;
import com.mycompany.webapp.dto.Bookmark;

@Service
public class BookmarkService {
	private static final Logger logger=LoggerFactory.getLogger(BookmarkService.class);
	
	@Resource
	private BookmarkDao bookmarkDao;

	public int bookmarkClick(Bookmark bookmark) {
		int rows=bookmarkDao.insertBookmarkClick(bookmark);
		return rows;
	}

	public int disbookmarkClick(Bookmark bookmark) {
		int rows=bookmarkDao.deleteBookmarkClick(bookmark);
		return rows;
	}

	public List<Bookmark> getBookmarks(String mid) {
		List<Bookmark> bookmarks = bookmarkDao.selectBookmarks(mid);
		return bookmarks;
	}
}
