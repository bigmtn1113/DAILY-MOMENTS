package com.mycompany.webapp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Tag;
import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.TagService;

@Controller
public class WriteController {
	@Resource private BoardService boardService;
	@Resource private TagService tagService;
	
	@GetMapping("/writeForm")
	public String writeForm() {
		return "writeForm";
	}
	
	@PostMapping("/write")
	public String write(MultipartHttpServletRequest request, HttpServletResponse response) {
		MultipartFile bphoto = request.getFile("bphoto");
		String mid = (String) request.getParameter("mid");
		String bcontent = (String) request.getParameter("bcontent");
		
		//content에서 tag들 추출
		String temp = bcontent;
		List<String> tagNames = new ArrayList<>();
		while (temp.contains("#")) {
			int wordFirstIndex = temp.indexOf('#');
			int wordLastIndex = temp.indexOf(' ', wordFirstIndex);
			
			if (wordLastIndex > 0) tagNames.add(temp.substring(wordFirstIndex + 1, wordLastIndex));
			else tagNames.add(temp.substring(wordFirstIndex + 1));
			
			temp = temp.replaceFirst("#", "");
		}
		
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
				
				//tagNames 저장
				int bno = boardService.getBno(saveFileName);
				Tag tag = new Tag();
				for (String tagName : tagNames) {
					tag.setTname(tagName);
					tag.setBno(bno);
					tagService.insert(tag);
				}
			} catch (Exception e) {}
		}
		
		return "feed";
	}
	
	@PostMapping("/updateBoard")
	public String updateBoard(Board board, HttpSession session) {
		session.setAttribute("existingBoard", board);
		return "writeForm";
	}
	
	@PostMapping("/update")
	public String update(MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session) {
		/*existingBoard 삭제*/
		Board existingBoard = (Board) session.getAttribute("existingBoard");
		MultipartFile bphoto = request.getFile("bphoto");
		
		//파일 삭제
		if (bphoto != null) {
			File file = new File("D:/MyWorkspace/java-projects/TeamProject/WebContent/resources/images/board/" + existingBoard.getBphoto());
			if (file.exists()) file.delete();
		}
		
		//content에서 tag들 추출
		String temp = existingBoard.getBcontent();
		List<String> tagNames = new ArrayList<>();
		while (temp.contains("#")) {
			int wordFirstIndex = temp.indexOf('#');
			int wordLastIndex = temp.indexOf(' ', wordFirstIndex);
			
			if (wordLastIndex > 0) tagNames.add(temp.substring(wordFirstIndex + 1, wordLastIndex));
			else tagNames.add(temp.substring(wordFirstIndex + 1));
			
			temp = temp.replaceFirst("#", "");
		}
		
		//tag 삭제
		Tag tag = new Tag();
		for (String tagName : tagNames) {
			tag.setTname(tagName);
			tag.setBno(existingBoard.getBno());
			tagService.delete(tag);
		}
		
		//------------------------------------------------------------------------------------------
		/*update*/
		String bcontent = (String) request.getParameter("bcontent");
		
		//content에서 tag들 추출
		temp = bcontent;
		tagNames = new ArrayList<>();
		while (temp.contains("#")) {
			int wordFirstIndex = temp.indexOf('#');
			int wordLastIndex = temp.indexOf(' ', wordFirstIndex);
			
			if (wordLastIndex > 0) tagNames.add(temp.substring(wordFirstIndex + 1, wordLastIndex));
			else tagNames.add(temp.substring(wordFirstIndex + 1));
			
			temp = temp.replaceFirst("#", "");
		}
		
		if (bphoto == null) {
			Board board = new Board();
			board.setBno(existingBoard.getBno());
			board.setBcontent(bcontent);
			boardService.updateOnlyBcontent(board);
			
			//tagNames 변경
			tag = new Tag();
			for (String tagName : tagNames) {
				tag.setTname(tagName);
				tag.setBno(existingBoard.getBno());
				tagService.insert(tag);
			}
		} else if(!bphoto.isEmpty()) {
			// 중복 방지를 위해 파일 앞에 시간 붙이기
			String saveFileName = new Date().getTime() + "_" + bphoto.getOriginalFilename();
			try {
				bphoto.transferTo(new File("D:/MyWorkspace/java-projects/TeamProject/WebContent/resources/images/board/" + saveFileName));
				
				Board board = new Board();
				board.setBno(existingBoard.getBno());
				board.setBcontent(bcontent);
				board.setBphoto(saveFileName);
				boardService.update(board);
				
				//tagNames 변경
				tag = new Tag();
				for (String tagName : tagNames) {
					tag.setTname(tagName);
					tag.setBno(existingBoard.getBno());
					tagService.insert(tag);
				}
			} catch (Exception e) {}
		}
		
		session.removeAttribute("existingBoard");
		return "feed";
	}
}