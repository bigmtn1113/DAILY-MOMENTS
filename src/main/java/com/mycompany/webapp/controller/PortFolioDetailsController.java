package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycompany.webapp.dto.Bcomment;
import com.mycompany.webapp.dto.Blike;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Bookmark;
import com.mycompany.webapp.service.BcommentService;
import com.mycompany.webapp.service.BlikeService;
import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.BookmarkService;


@Controller
public class PortFolioDetailsController {
	@Resource private BoardService boardSerivce;
	@Resource private BlikeService blikeService;
	@Resource private BookmarkService bookmarkService;
	@Resource private BcommentService bcommentService;
	
	@GetMapping("/portfolioDetails")
	public String portfolioDetails(String bphoto, Model model, HttpSession session) {
		String mid = (String) session.getAttribute("mid");
		
		Board board = boardSerivce.getBoard(bphoto);
		int likeCnt = blikeService.getLikeCnt(board.getBno());
		int likeClick = blikeService.checkLikeClick(new Blike(board.getBno(), mid));
		int bookmarkClick = bookmarkService.checkBookmarkClick(new Bookmark(board.getBno(), mid));
		List<Bcomment> bcomments = bcommentService.getBcomments(board.getBno());
		
		model.addAttribute("board", board);
		model.addAttribute("likeCnt", likeCnt);
		model.addAttribute("likeClick", likeClick);
		model.addAttribute("bookmarkClick", bookmarkClick);
		model.addAttribute("bcomments", bcomments);
		
		return "portfolioDetails";
	}	
}