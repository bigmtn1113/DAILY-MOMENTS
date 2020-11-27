package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;

@Repository
public class QnaDao {

	@Resource
	private SqlSessionTemplate sst;
	
	public int countAll() {
		int totalRows = sst.selectOne("mybatis.mapper.qna.countAll");
		return totalRows; 
	}
	
	public List<Qna> selectByPage(Pager pager) {
		List<Qna> list = sst.selectList("mybatis.mapper.qna.selectByPage", pager);
		return list;
	}

	public int insert(Qna qna) {
		int rows = sst.insert("mybatis.mapper.qna.insert", qna);
		return rows;
		
			
	}
	
}
