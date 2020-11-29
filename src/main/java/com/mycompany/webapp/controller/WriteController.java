package com.mycompany.webapp.controller;

import java.io.File;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.service.BoardService;

@Controller
public class WriteController {
	private static final Logger logger = LoggerFactory.getLogger(WriteController.class);
	
	@Resource private BoardService boardService;
	
	@GetMapping("/writeForm")
	public String writeForm() {
		logger.info("실행");
		
		return "writeForm";
	}
	
	@PostMapping("/write")
	public String write(MultipartHttpServletRequest request, HttpServletResponse response) {
		MultipartFile bphoto = request.getFile("bphoto");
		String mid = (String) request.getParameter("mid");
		String bcontent = (String) request.getParameter("bcontent");
		
		if(!bphoto.isEmpty()) {
			// 중복 방지를 위해 파일 앞에 시간 붙이기
			String saveFileName = new Date().getTime() + "_" + bphoto.getOriginalFilename();
			try {
				bphoto.transferTo(new File("D:/MyWorkspace/java-projects/TeamProject/WebContent/resources/images/board/" + saveFileName));
				
				Board board = new Board();
				board.setBcontent(bcontent);
				board.setBphoto(saveFileName);
				board.setMid(mid);
				boardService.write(board);
			} catch (Exception e) {}
		}
		
		return "feed";
	}	
}