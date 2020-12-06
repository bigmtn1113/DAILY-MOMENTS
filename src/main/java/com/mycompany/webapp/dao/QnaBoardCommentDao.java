package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Bcomment;
import com.mycompany.webapp.dto.QnaBoardComment;

@Repository
public class QnaBoardCommentDao {

	@Resource private SqlSessionTemplate sst;
	
	
	

	
	
	
	public int insert(QnaBoardComment qnaBoardComment){
		int rows = sst.insert("mybatis.mapper.qnaboardcomment.insert", qnaBoardComment);
		return rows;
	}

	public List<QnaBoardComment> selectQnaBoardCommentWrite(int bno) {
		List<QnaBoardComment> qnaBoardCommentWrite = sst.selectList("mybatis.mapper.qnaboardcomment.selectQnaBoardCommentWrite", bno);
		return qnaBoardCommentWrite;
	}

	public List<QnaBoardComment> selectBoardComments(int bno) {
		List<QnaBoardComment> boardComments = sst.selectList("mybatis.mapper.qnaboardcomment.selectBoardComments", bno);
		return boardComments;
	}
	
	
	
}
