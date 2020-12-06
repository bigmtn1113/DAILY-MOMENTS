package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Notice;
import com.mycompany.webapp.dto.Pager;

@Repository
public class NoticeDao {

	
	
	@Resource private SqlSessionTemplate sst;

	public int countAll() {
		int totalRows = sst.selectOne("mybatis.mapper.notice.countAll");
		return totalRows;
	}

	public List<Notice> selectByPage(Pager pager) {
		List<Notice> list = sst.selectList("mybatis.mapper.notice.selectByPage", pager);
		return list;
	}

	public void insert(Notice notice) {
		sst.selectOne("mybatis.mapper.notice.insert", notice);
	}

	public Notice selectByBno(int bno) {
		Notice noticeBoard = sst.selectOne("mybatis.mapper.notice.selectByBno", bno);
		return noticeBoard;
	}

	public void deleteByBno(int bno) {
		sst.delete("mybatis.mapper.notice.deleteByBno", bno);
		
	}

	public void updateNoticeDetail(Notice notice) {
		sst.update("mybatis.mapper.notice.updateNoticeDetail", notice);
		
	}


}



