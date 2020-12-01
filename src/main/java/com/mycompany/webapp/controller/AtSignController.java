package com.mycompany.webapp.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private static final Logger logger = LoggerFactory.getLogger(AtSignController.class);
	
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
		List<String> memberBphotos = boardService.getMemberBphotos(searchedId);
		
		model.addAttribute("member", member);
		model.addAttribute("followingMembers", followingMembers);
		model.addAttribute("memberBcnt", memberBcnt);
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);
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