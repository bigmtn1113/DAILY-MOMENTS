package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.BlikeService;
import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.MemberService;


@Controller
public class PortFolioDetailsController {
	@Resource private BoardService boardSerivce;
	@Resource private MemberService memberService;
	@Resource private BlikeService blikeService;
	
	@GetMapping("/portfolioDetails")
	public String portfolioDetails(Board board, Model model) {
		
		String bphotoName = board.getBphoto();
		
		board = boardSerivce.getBphoto(bphotoName);
		
		String mid = board.getMid();
		String mPhoto = memberService.getMphoto(mid);
		int likeCnt = blikeService.getLikeCnt(board.getBno());
		
		System.out.println("likeCnt : " + likeCnt);
		model.addAttribute("board", board);
		model.addAttribute("mphoto", mPhoto);
		model.addAttribute("likeCnt", likeCnt);
		
		return "portfolioDetails";
	}	
}