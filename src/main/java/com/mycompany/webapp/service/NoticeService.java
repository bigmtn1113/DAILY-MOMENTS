package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.NoticeDao;
import com.mycompany.webapp.dto.Notice;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;

@Service
public class NoticeService {

	@Resource private NoticeDao noticeDao;
	
	public int getNoticeTotalRows() {
		int totalRows = noticeDao.countAll();
		return totalRows;
	}

	public List<Notice> getNoticeList(Pager pager) {
		List<Notice> list = noticeDao.selectByPage(pager);
		return list;
	}

	public void noticeWrite(Notice notice) {
		noticeDao.insert(notice);

	}

	public Notice getNoticeBoard(int bno) {
		Notice noticeBoard = noticeDao.selectByBno(bno);
		return noticeBoard;
	}

	public void noticeDetailDelete(int bno) {
		noticeDao.deleteByBno(bno);
	}

	public void noticeDetailUpdate(Notice notice) {
		noticeDao.updateNoticeDetail(notice);
	}
}
