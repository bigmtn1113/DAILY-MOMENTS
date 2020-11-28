package com.mycompany.webapp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.webapp.dto.Bcomment;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;
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
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@GetMapping("/join")
	public String join() {
		logger.info("실행");
		return "join";
	}
	
	@PostMapping("/join")
	public String join(Member member) {
		logger.info("실행");
		
		PasswordEncoder passwordEncoder=PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encodedPassword=passwordEncoder.encode(member.getMpassword());
		
		member.setMpassword(encodedPassword);
		member.setMenabled(true);
		service.join(member);
		
		return "index";
	}
	
	@RequestMapping("/feed")
	public String feed(HttpSession session, Model model) {
		/*List<Board> boards = service.getBoards();
		List<String> memberPhotos = new ArrayList<>();
		List<Integer> likeCnts = new ArrayList<>();
		List<List<Bcomment>> boardCommentsList = new ArrayList<>();
		
		for (Board board : boards) {
			memberPhotos.add(service.getMemberPhoto(board.getMid()));
			likeCnts.add(service.getLikeCnt(board.getBno()));
			boardCommentsList.add(service.getBoardComments(board.getBno()));
		}
		
		model.addAttribute("boards", boards);
		model.addAttribute("memberPhotos", memberPhotos);
		model.addAttribute("likeCnts", likeCnts);
		model.addAttribute("boardCommentsList", boardCommentsList);*/
		
		String mid = (String) session.getAttribute("mid");
		List<Board> boards = service.getBoards(mid);
		List<List<Bcomment>> boardCommentsList = new ArrayList<>();
		
		for (Board board : boards)
			boardCommentsList.add(service.getBoardComments(board.getBno()));
		
		model.addAttribute("boards", boards);
		model.addAttribute("boardCommentsList", boardCommentsList);
		return "feed";
	}
	
	@RequestMapping("/atSign")
	public String atSign(String mid, Model model) {
		logger.info(mid);
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
	
	@GetMapping("/writeForm")
	public String writeForm() {
		logger.info("실행");
		return "writeForm";
	}
	
	@PostMapping("/write")
	public String write(MultipartHttpServletRequest request, HttpServletResponse response) {
		
		MultipartFile bphoto=request.getFile("bphoto");
		String mid=(String) request.getParameter("mid");
		String bcontent=(String) request.getParameter("bcontent");
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
		return "feed";
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
	public String setting(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("mid");
		
		Member member = service.getMember(mid);
		model.addAttribute("member", member);
		return "setting";
	}
	
	@PostMapping("/setting")
	public String setting(Member member, HttpSession session) {

		String saveFileName = new Date().getTime() + "_" + member.getAttachMphoto().getOriginalFilename();

		try {
			member.getAttachMphoto().transferTo(new File("D:/MyWorkspace/java-projects/TeamProject/WebContent/resources/images/member/" + saveFileName));
			member.setMphoto(saveFileName);
			service.memberUpdate(member);
			
		} catch (Exception e) {}
		
		session.setAttribute("member", member);
		return "index";
	}
	
	//이부분은 준엽이가 한 부분이므로 지우지 말것 ///////////////////////////////////////
	
	@GetMapping("/qna")
	public String qna(Model model) {
		//게시물 목록 가져오기
		int totalRows = service.getQnaTotalRows();
		Pager pager = new Pager(5, 5, totalRows, 1);
		List<Qna> list = service.getQnaList(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "qna";
	}
	
	@PostMapping("/qnaWrite")
	public String qnaWrite(Qna qna, HttpServletRequest request, Model model) throws Exception {
		//로그인한 mid 세팅
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		qna.setMid(mid);
		
		//서비스를 이용해서 게시물 쓰기
		service.qnaWrite(qna);
		
		//게시물 목록 가져오기
		int totalRows = service.getQnaTotalRows();
		Pager pager = new Pager(5, 5, totalRows, 1);
		List<Qna> list = service.getQnaList(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "qnaList";
	}
	
	
}