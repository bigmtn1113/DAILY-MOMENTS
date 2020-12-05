package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BookmarkDao;
import com.mycompany.webapp.dto.Bookmark;

@Service
public class BookmarkService {
	@Resource private BookmarkDao bookmarkDao;

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

	public int checkBookmarkClick(Bookmark bookmark) {
		int bookmarkClick = bookmarkDao.selectBookmarkClickCheck(bookmark);
		return bookmarkClick;
	}
}
