package com.mycompany.webapp.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Follow;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.FollowService;
import com.mycompany.webapp.service.MemberService;

@Controller
public class AtSignController {
	@Resource private MemberService memberService;
	@Resource private BoardService boardService;
	@Resource private FollowService followService;
	
	@RequestMapping("/atSign")
	public String atSign(String searchedId, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("mid");
		
		Member member = memberService.getMember(searchedId);
		List<String> followingMembers = followService.getFollowingMembers(mid);
		int memberBcnt = boardService.getMemberBcnt(searchedId);
		int followerCnt = followService.getFollowerCnt(searchedId);
		int followingCnt = followService.getFollowingCnt(searchedId);
		List<String> followerIDs = followService.getFollowerID(searchedId);
		List<String> followingIDs = followService.getFollowingID(searchedId);
		List<String> followerPhotos = new ArrayList<>();
		List<String> followingPhotos = new ArrayList<>();
		List<String> memberBphotos = boardService.getMemberBphotos(searchedId);
		
		
		for(String followerID : followerIDs) {
			followerPhotos.add(followService.getFollowerPhotos(followerID));
		}
		
		for(String followingID : followingIDs) {
			followingPhotos.add(followService.getFollowingPhotos(followingID));
		}
		
		
		model.addAttribute("member", member);
		model.addAttribute("followingMembers", followingMembers);
		model.addAttribute("memberBcnt", memberBcnt);
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);
		model.addAttribute("followerIDs", followerIDs);
		model.addAttribute("followingIDs", followingIDs);
		model.addAttribute("followerPhotos", followerPhotos);
		model.addAttribute("followingPhotos", followingPhotos);
		model.addAttribute("memberBphotos", memberBphotos);
		
		return "atSign";
	}
	
	@RequestMapping("/follow")
	public void follow(Follow follow, HttpServletResponse response) throws Exception {
		followService.insert(follow);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/unFollow")
	public void unFollow(Follow follow, HttpServletResponse response) throws Exception {
		followService.delete(follow);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
}