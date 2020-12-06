package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Bcomment;
import com.mycompany.webapp.dto.Blike;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.service.BcommentService;
import com.mycompany.webapp.service.BlikeService;
import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.MemberService;

@Controller
public class NotificationController {
	private static final Logger logger = LoggerFactory.getLogger(NotificationController.class);
	
	@Resource private BoardService boardService;
	@Resource private BlikeService blikeService;
	@Resource private BcommentService bcommentService;
	@Resource private MemberService memberService;
	
	@RequestMapping("/notification")
	public String notification(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("mid");
		List<Integer> boardBno = boardService.getBoardbno(mid);
		List<List<Blike>> likeMids=new ArrayList<>();
		List<List<String>> memberProfiles = new ArrayList<>();
		
		for(Integer boardbno:boardBno) {
			List<Blike> likeMid = blikeService.getLikemid(boardbno);
			List<String> memberProfile = memberService.getMemberProfile(likeMid);
			
			if (!likeMid.isEmpty()) {
				likeMids.add(likeMid);
				memberProfiles.add(memberProfile);
			}
		}
		
		/*for (List<Blike> likeMid : likeMids) {
			for (Blike like: likeMid) {
				System.out.println(like.getMid() + like.getBno() + like.getLdate());
			}
			System.out.println();
		}*/
		
		model.addAttribute("likeMids", likeMids);
		model.addAttribute("memberProfiles",memberProfiles);
		return "notification";
	}	
}
