package com.mycompany.webapp.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.MemberService;

@Controller
public class SettingController {
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
		String saveFileName = member.getMid() + "_" + member.getAttachMphoto().getOriginalFilename();

		try {
			member.getAttachMphoto().transferTo(new File("D:/MyWorkspace/images/member/" + saveFileName));
			member.setMphoto(saveFileName);
			memberService.memberUpdate(member);
			
		} catch (Exception e) {}
		
		session.setAttribute("member", member);
		
		return "index";
	}	
}