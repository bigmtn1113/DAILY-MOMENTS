package com.mycompany.webapp.controller;

import java.io.File;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.MemberService;

@Controller
public class SettingController {
	private static final Logger logger = LoggerFactory.getLogger(SettingController.class);
	
	@Resource private MemberService memberService;
	
	@GetMapping("/setting")
	public String setting(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("mid");
		
		Member member = memberService.getMember(mid);
		model.addAttribute("member", member);
		
		return "setting";
	}
	
	@PostMapping("/setting")
	public String setting(Member member, HttpSession session) {
		String saveFileName = new Date().getTime() + "_" + member.getAttachMphoto().getOriginalFilename();

		try {
			member.getAttachMphoto().transferTo(new File("D:/MyWorkspace/java-projects/TeamProject/WebContent/resources/images/member/" + saveFileName));
			member.setMphoto(saveFileName);
			memberService.memberUpdate(member);
			
		} catch (Exception e) {}
		
		session.setAttribute("member", member);
		
		return "index";
	}	
}