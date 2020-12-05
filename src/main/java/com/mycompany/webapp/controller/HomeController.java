package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.MemberService;

@Controller
public class HomeController {
	@Resource private MemberService memberService;
	
	@RequestMapping("/")
	public String index() {
		
		return "index";
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		
		return "loginForm";
	}
	
	@GetMapping("/joinForm")
	public String join() {
		
		return "joinForm";
	}
	
	@PostMapping("/join")
	public String join(Member member) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(member.getMpassword());
		
		member.setMpassword(encodedPassword);
		member.setMenabled(true);
		memberService.join(member);
		
		return "index";
	}	
}