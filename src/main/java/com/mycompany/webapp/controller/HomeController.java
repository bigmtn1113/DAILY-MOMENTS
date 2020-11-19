package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/index")
	public String index() {
		logger.info("실행");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/login")
	public String login() {
		logger.info("실행");
		return "login";
	}
	
	@RequestMapping("/join")
	public String join() {
		logger.info("실행");
		return "join";
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
	
	@RequestMapping("/profile")
	public String profile() {
		logger.info("실행");
		return "profile";
	}
	
	@RequestMapping("/setting")
	public String setting() {
		logger.info("실행");
		return "setting";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		logger.info("실행");
		return "redirect:/index.jsp";
	}
}
