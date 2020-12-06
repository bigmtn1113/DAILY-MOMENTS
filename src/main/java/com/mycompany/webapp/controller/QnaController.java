package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;
import com.mycompany.webapp.dto.QnaBoardComment;
import com.mycompany.webapp.service.QnaBoardCommentService;
import com.mycompany.webapp.service.QnaService;

@Controller
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	
	@Resource private QnaService qnaService;
	@Resource private QnaBoardCommentService qnaBoardCommentService;
	
	
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
	
	@GetMapping("/qnaList")
	public String qnaList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		int totalRows = qnaService.getQnaTotalRows();
		Pager pager = new Pager(5, 5, totalRows, pageNo);
		List<Qna> list = qnaService.getQnaList(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "qnaList";
		
	}
	
	@GetMapping("/qnaDetail")
	public String qnaDetail(HttpSession session, int bno, Model model) {
		Qna qnaBoard = qnaService.getQnaBoard(bno);
		model.addAttribute("qnaBoard", qnaBoard);
		
		List<QnaBoardComment> qnaBoardCommentsList = qnaBoardCommentService.getBoardComments(bno);
		model.addAttribute("qnaBoardCommentsList", qnaBoardCommentsList);
		
		return "qnaDetail";
	}
	
	
	
	@GetMapping("/photodownload")
	public void photodownload(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkspace/java-projects/TeamProject/WebContent/resources/images/board/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);
		
		//응답 HTTP 헤더 구성
		//1)Content - Type 헤더 구성(파일의 종류)
		ServletContext application = request.getServletContext();
		String fileType = application.getMimeType(fileName);
		response.setContentType("fileType");
		//2) Content-Disposition 헤더 구성(다운로드할 파일의 이름 지정)
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		//3) Content-Length 헤더 구성(다운로드할 파일의 크기를 지정)
		int fileSize = (int)new File(saveFilePath).length();
		response.setContentLength(fileSize);
		
		//응답 HTTP의 바디(본문) 구성
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os); //is에서 읽어서 os로 보낸다는 뜻
		os.flush();
		os.close();
		is.close();
		
	}	
		
	@PostMapping("/qnaDetailDelete")
	public void	qnaDetailDelete(int bno, HttpServletResponse response) throws IOException {
		qnaService.qnaDetailDelete(bno);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
					
	@GetMapping("/qnaDetailUpdate")
	public String qnaDetailUpdate(int bno, Model model) {
		Qna qnaBoard = qnaService.getQnaBoard(bno);
		model.addAttribute("qnaBoard", qnaBoard);
		return "qnaDetailUpdate";
	}
	
	@PostMapping("/qnaDetailUpdate")
	public void qnaDetailUpdate(Qna qna, HttpServletResponse response) throws IOException {
		qnaService.qnaDetailUpdate(qna);
		
		//JSON 생성
		JSONObject jsonObject = new JSONObject();  //결과값 {} 요렇게 나오려면 이렇게, 배열로 [] 나오려면 array로 써라
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); //{"result" : "success"}
		
		//응답 보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	
	
	@RequestMapping("/qnaCommentWrite")
	public String qnaCommentWrite(HttpSession session, String ccomment,int bno, String mid, Model model, HttpServletResponse response) throws IOException, ServletException {
		
		logger.info(mid);
		logger.info(ccomment);
		
		
		QnaBoardComment qnaBoardComment=new QnaBoardComment();
		qnaBoardComment.setBno(bno);
		qnaBoardComment.setCcontent(ccomment);   
		qnaBoardComment.setMid(mid);
		qnaBoardCommentService.QnaCommentsWrite(qnaBoardComment);
		
		List<QnaBoardComment> qnaBoardCommentsListWrite = qnaBoardCommentService.getQnaBoardCommentWrite(bno);
		
		model.addAttribute("qnaBoardCommentsListWrite", qnaBoardCommentsListWrite);
		return "qnaCommentHTML";
	}	
}
