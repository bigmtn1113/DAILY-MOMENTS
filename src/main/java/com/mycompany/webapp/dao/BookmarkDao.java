package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Bookmark;

@Repository
public class BookmarkDao {
	
	@Resource private SqlSessionTemplate sst;

	public int insertBookmarkClick(Bookmark bookmark) {
		int rows=sst.insert("mybatis.mapper.bookmark.insert",bookmark);
		return rows;
	}

	public int deleteBookmarkClick(Bookmark bookmark) {
		int rows=sst.delete("mybatis.mapper.bookmark.delete",bookmark);
		return rows;
	}

	public List<Bookmark> selectBookmarks(String mid) {
		List<Bookmark> bookmarks = sst.selectList("mybatis.mapper.bookmark.selectBookmarks", mid);
		return bookmarks;
	}

	public int selectBookmarkClickCheck(Bookmark bookmark) {
		int bookmarkClick = sst.selectOne("mybatis.mapper.bookmark.selectBookmarkClickCheck", bookmark);
		return bookmarkClick;
	}
}
