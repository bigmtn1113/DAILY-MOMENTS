package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Bcomment;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Qna;
import com.mycompany.webapp.service.BcommentService;
import com.mycompany.webapp.service.BlikeService;
import com.mycompany.webapp.service.BoardService;

@Controller
public class FeedController {
	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);

	@Resource
	private BoardService boardService;
	@Resource
	private BlikeService blikeService;
	@Resource
	private BcommentService bcommentService;

	@RequestMapping("/feed")
	public String feed(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("mid");

		List<Board> boards = boardService.getBoards(mid);
		List<Integer> likeCnts = new ArrayList<>();
		List<List<Bcomment>> boardCommentsList = new ArrayList<>();

		for (Board board : boards) {
			likeCnts.add(blikeService.getLikeCnt(board.getBno()));
			boardCommentsList.add(bcommentService.getBoardComments(board.getBno()));
		}

		model.addAttribute("boards", boards);
		model.addAttribute("likeCnts", likeCnts);
		model.addAttribute("boardCommentsList", boardCommentsList);

		return "feed";
	}

	@RequestMapping("/commentWrite")
	public String commentWrite(HttpSession session, String ccomment,int bno, String mid, Model model, HttpServletResponse response) throws IOException, ServletException {
		
		Bcomment bcomment=new Bcomment();
		bcomment.setBno(bno);
		bcomment.setCcontent(ccomment);
		bcomment.setMid(mid);
		bcommentService.CommentsWrite(bcomment);
		
		List<Bcomment> boardCommentsListWrite = bcommentService.getBoardCommentsWrite(bno);
		
		model.addAttribute("boardCommentsListWrite", boardCommentsListWrite);
		return "commentHTML";
	}
}