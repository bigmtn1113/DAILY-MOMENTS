package com.mycompany.webapp.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.WebService;

@Controller
public class HomeController {
	
	@Resource
	private WebService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String index() {
		logger.info("실행");
		return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(String mid, String mpassword, HttpSession session) {
		logger.info("실행");
		Member member = (Member)session.getAttribute("member");
		if (member == null)
			return "index";
		
		if (member.getMid().equals(mid) && member.getMpassword().equals(mpassword)) {
			session.setAttribute("mid", mid);
			return "index";
		} else {
			return "index";
		}
	}
	
	@GetMapping("/join")
	public String join() {
		logger.info("실행");
		return "join";
	}
	
	@PostMapping("/join")
	public String join(Member member, HttpSession session) {
		logger.info("실행");
		session.setAttribute("member", member);
		return "index";
	}
	
	@RequestMapping("/feed")
	public String feed(Model model) {
		List<Board> boards = service.getBoards();
		
		model.addAttribute("boards", boards);
		return "feed";
	}
	
	@RequestMapping("/atSign")
	public String atSign(String mid, Model model) {
		Member member = service.getMember(mid);
		int memberBcnt = service.getMemberBcnt(mid);
		List<String> memberBphotos = service.getMemberBphotos(mid);
		
		int followerCnt = service.getFollowerCnt(mid);
		int followingCnt = service.getFollowingCnt(mid);
		
		model.addAttribute("member", member);
		model.addAttribute("memberBcnt", memberBcnt);
		model.addAttribute("memberBphotos", memberBphotos);
		
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);
		
		return "atSign";
	}
	
	@RequestMapping("/tag")
	public String tag() {
		logger.info("실행");
		return "tag";
	}
	
	@GetMapping("/write")
	public String write() {
		logger.info("실행");
		return "write";
	}
	
	@PostMapping("/write")
	public String write(String bcontent, MultipartFile bphoto, String mid) {
		if(!bphoto.isEmpty()) {
			// 중복 방지를 위해 파일 앞에 시간 붙이기
			String saveFileName = new Date().getTime() + "_" + bphoto.getOriginalFilename();
			try {
				bphoto.transferTo(new File("D:/MyWorkspace/java-projects/TeamProject/WebContent/resources/images/board/" + saveFileName));
				
				Board board = new Board();
				board.setBcontent(bcontent);
				board.setBphoto(saveFileName);
				board.setMid(mid);
				service.write(board);
			} catch (Exception e) {}
		}
		return "index";
	}
	
	@GetMapping("/profile")
	public String profile(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("mid");
		
		Member member = service.getMember(mid);
		int memberBcnt = service.getMemberBcnt(mid);
		List<String> memberBphotos = service.getMemberBphotos(mid);
		
		int followerCnt = service.getFollowerCnt(mid);
		int followingCnt = service.getFollowingCnt(mid);
		
		model.addAttribute("member", member);
		model.addAttribute("memberBcnt", memberBcnt);
		model.addAttribute("memberBphotos", memberBphotos);
		
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);
		
		return "profile";
	}
	
	@GetMapping("/portfolioDetails")
	public String portfolioDetails() {
		logger.info("실행");
		return "portfolioDetails";
	}
	
	@GetMapping("/setting")
	public String setting() {
		logger.info("실행");
		return "setting";
	}
	
	@PostMapping("/setting")
	public String setting(Member member, HttpSession session) {
		logger.info("실행");
		session.setAttribute("member", member);
		return "index";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("실행");
		session.invalidate();
		return "index";
	}
}