package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Bcomment;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.service.BcommentService;
import com.mycompany.webapp.service.BlikeService;
import com.mycompany.webapp.service.BoardService;

@Controller
public class NotificationController {
	private static final Logger logger = LoggerFactory.getLogger(NotificationController.class);
	
	@Resource private BoardService boardService;
	@Resource private BlikeService blikeService;
	@Resource private BcommentService bcommentService;
	
	@RequestMapping("/notification")
	public String notification(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("mid");

		List<Board> boards = boardService.getBoards(mid);
		List<List<Bcomment>> boardCommentsList = new ArrayList<>();
		
		for (Board board : boards) {
			boardCommentsList.add(bcommentService.getBoardComments(board.getBno()));
		}
		
		model.addAttribute("boards", boards);
		model.addAttribute("boardCommentsList", boardCommentsList);
			
		return "notification";
	}	
}