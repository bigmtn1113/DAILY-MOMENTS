package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.QnaBoardCommentDao;
import com.mycompany.webapp.dto.QnaBoardComment;

@Service
public class QnaBoardCommentService {
	
		@Resource private QnaBoardCommentDao qnaBoardCommentDao;
	
			
		
		
		

		
		public void QnaCommentsWrite(QnaBoardComment qnaBoardComment) {
			qnaBoardCommentDao.insert(qnaBoardComment);
		}

		public List<QnaBoardComment> getQnaBoardCommentWrite(int bno) {
			List<QnaBoardComment> qnaBoardComment = qnaBoardCommentDao.selectQnaBoardCommentWrite(bno);
			return qnaBoardComment;
		}

		public List<QnaBoardComment> getBoardComments(int bno) {
			List<QnaBoardComment> boardComments = qnaBoardCommentDao.selectBoardComments(bno);
			return boardComments;
		}
		
		
		
}
