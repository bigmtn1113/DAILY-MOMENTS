package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.FollowService;
import com.mycompany.webapp.service.MemberService;

@Controller
public class ProfileController {
	@Resource private MemberService memberService;
	@Resource private BoardService boardService;
	@Resource private FollowService followService;
	
	@GetMapping("/profile")
	public String profile(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("mid");
		
		Member member = memberService.getMember(mid);
		int memberBcnt = boardService.getMemberBcnt(mid);
		int memberBMcnt = boardService.getMemberBMcnt(mid);
		int followerCnt = followService.getFollowerCnt(mid);
		int followingCnt = followService.getFollowingCnt(mid);
		List<String> followerIDs = followService.getFollowerID(mid);
		List<String> followingIDs = followService.getFollowingID(mid);
		List<String> followerPhotos = new ArrayList<>();
		List<String> followingPhotos = new ArrayList<>();
		List<String> profilePhotos = boardService.getProfilePhotos(mid);
		
		for(String followerID : followerIDs) {
			followerPhotos.add(followService.getFollowerPhotos(followerID));
		}
		
		for(String followingID : followingIDs) {
			followingPhotos.add(followService.getFollowingPhotos(followingID));
		}
		
		
		model.addAttribute("member", member);
		model.addAttribute("memberBcnt", memberBcnt);
		model.addAttribute("memberBMcnt", memberBMcnt);
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);
		model.addAttribute("followerIDs", followerIDs);
		model.addAttribute("followingIDs", followingIDs);
		model.addAttribute("followerPhotos", followerPhotos);
		model.addAttribute("followingPhotos", followingPhotos);
		model.addAttribute("profilePhotos", profilePhotos);
		
		return "profile";
	}	
}