package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Notice;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;
import com.mycompany.webapp.service.NoticeService;

@Controller
public class NoticeController {

	@Resource private NoticeService noticeService;

	@GetMapping("/notice")
	public String notice(Model model) {
		//게시물 목록 가져오기
		int totalRows = noticeService.getNoticeTotalRows();
		Pager pager = new Pager(5, 5, totalRows, 1);
		List<Notice> list = noticeService.getNoticeList(pager);
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		
		return "notice";
	}
	
	
	@GetMapping("/noticeWrite")
	public String noticeWrite() {
		return "noticeWriteForm";
	}
	
	@PostMapping("/noticeWrite")
	public String noticeWrite(Notice notice, HttpServletRequest request, Model model) throws Exception {
		//로그인한 mid 세팅
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		notice.setMid(mid);
		
		//서비스를 이용해서 게시물 쓰기 
		noticeService.noticeWrite(notice);
		
		//게시물 목록 가져오기
		int totalRows = noticeService.getNoticeTotalRows();
		Pager pager = new Pager(5, 5, totalRows, 1);
		List<Notice> list = noticeService.getNoticeList(pager);
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		
		return "notice";
		
	}
	
	
	@GetMapping("/noticeList")
	public String noticeList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		int totalRows = noticeService.getNoticeTotalRows();
		Pager pager = new Pager(5, 5, totalRows, pageNo);
		List<Notice> list = noticeService.getNoticeList(pager);
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		
		return "noticeList";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(int bno, Model model) {
		Notice noticeBoard = noticeService.getNoticeBoard(bno);
		model.addAttribute("noticeBoard", noticeBoard);
		return"noticeDetail";
	}
	
	@PostMapping("noticeDetailDelete")
	public void noticeDetailDelete(int bno, HttpServletResponse response) throws Exception {
		noticeService.noticeDetailDelete(bno);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result","success");
		String json = jsonObject.toString();
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
		
	}
	
	
	@GetMapping("/noticeDetailUpdate")
	public String noticeDetailUpdate(int bno, Model model) {
		Notice noticeBoard = noticeService.getNoticeBoard(bno);
		model.addAttribute("noticeBoard", noticeBoard);
		
		return"noticeDetailUpdate";
	}

	@PostMapping("/noticeDetailUpdate") 
	public void noticeDetailUpdate(Notice notice, HttpServletResponse response) throws Exception {
		noticeService.noticeDetailUpdate(notice);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	
	}
	
}





















