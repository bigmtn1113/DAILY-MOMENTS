package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;
import com.mycompany.webapp.service.QnaService;

@Controller
public class QnaController {
	@Resource private QnaService qnaService;
	
	@GetMapping("/qna")
	public String qna(Model model) {
		//게시물 목록 가져오기
		int totalRows = qnaService.getQnaTotalRows();
		Pager pager = new Pager(5, 5, totalRows, 1);
		List<Qna> list = qnaService.getQnaList(pager);
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		
		return "qna";
	}
	
	@PostMapping("/qnaWrite")
	public String qnaWrite(Qna qna, HttpServletRequest request, Model model) throws Exception {
		//로그인한 mid 세팅
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		qna.setMid(mid);
		
		//서비스를 이용해서 게시물 쓰기
		qnaService.qnaWrite(qna);
		
		//게시물 목록 가져오기
		int totalRows = qnaService.getQnaTotalRows();
		Pager pager = new Pager(5, 5, totalRows, 1);
		List<Qna> list = qnaService.getQnaList(pager);
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		
		return "qnaList";
	}
}