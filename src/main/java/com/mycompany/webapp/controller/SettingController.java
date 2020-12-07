package com.mycompany.webapp.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
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
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(member.getMpassword());
		String fileName = member.getAttachMphoto().getOriginalFilename();
		
		member.setMpassword(encodedPassword);
		try {
			if (!fileName.equals("")) {String saveFileName = member.getMid() + "_" + fileName;
				member.getAttachMphoto().transferTo(new File("D:/MyWorkspace/java-projects/TeamProject/WebContent/resources/images/member/" + saveFileName));
				member.setMphoto(saveFileName);
				memberService.memberUpdate(member);
			} else {
				memberService.memberUpdateExcludeImage(member);
			}
		} catch (Exception e) {}
		
		session.setAttribute("member", member);
		
		return "index";
	}	
}