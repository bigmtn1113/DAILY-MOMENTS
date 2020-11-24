package com.mycompany.webapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		return "index";
	}
	
	@RequestMapping("/feed")
	public String feed() {
		logger.info("실행");
		return "feed";
	}
	
	@RequestMapping("/at-sign")
	public String atSign() {
		logger.info("실행");
		return "at-sign";
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
	
	@RequestMapping("/profile")
	public String profile() {
		logger.info("실행");
		return "profile";
	}
	
	@GetMapping("/portfolio-details")
	public String portfolioDetails() {
		logger.info("실행");
		return "portfolio-details";
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
	
	@RequestMapping("/portfoliodetail")
	public String portfoliodetail() {
		logger.info("실행");
		return "portfolio-details";
	}
}