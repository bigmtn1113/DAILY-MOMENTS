package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.QnaDao;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;

@Service
public class QnaService {
	@Resource private QnaDao qnaDao;
	
	public int getQnaTotalRows() {
		int totalRows = qnaDao.countAll();
		return totalRows;
	}

	public List<Qna> getQnaList(Pager pager) {
		List<Qna> list = qnaDao.selectByPage(pager);
		return list;
	}

	public void qnaWrite(Qna qna) {
		qnaDao.insert(qna);
	}
}
