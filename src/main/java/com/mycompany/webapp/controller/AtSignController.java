package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.FollowService;
import com.mycompany.webapp.service.MemberService;

@Controller
public class AtSignController {
	private static final Logger logger = LoggerFactory.getLogger(AtSignController.class);
	
	@Resource private MemberService memberService;
	@Resource private BoardService boardService;
	@Resource private FollowService followService;
	
	@RequestMapping("/atSign")
	public String atSign(String mid, Model model) {

		Member member = memberService.getMember(mid);
		int memberBcnt = boardService.getMemberBcnt(mid);
		int followerCnt = followService.getFollowerCnt(mid);
		int followingCnt = followService.getFollowingCnt(mid);
		List<String> memberBphotos = boardService.getMemberBphotos(mid);
		
		model.addAttribute("member", member);
		model.addAttribute("memberBcnt", memberBcnt);
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);
		model.addAttribute("memberBphotos", memberBphotos);
		
		return "atSign";
	}
}