package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Bcomment;
import com.mycompany.webapp.dto.Blike;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Bookmark;
import com.mycompany.webapp.service.BcommentService;
import com.mycompany.webapp.service.BlikeService;
import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.BookmarkService;

@Controller
public class FeedController {
	@Resource private BookmarkService bookmarkService;
	@Resource private BoardService boardService;
	@Resource private BlikeService blikeService;
	@Resource private BcommentService bcommentService;

	@RequestMapping("/feed")
	public String feed(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("mid");

		List<Board> boards = boardService.getBoards(mid);
		List<Integer> likeCnts = new ArrayList<>();
		List<List<Bcomment>> boardCommentsList = new ArrayList<>();
		List<Blike> blikes = blikeService.getBlikes(mid);
		List<Bookmark> bookmarks = bookmarkService.getBookmarks(mid);
		
		for (Board board : boards) {
			likeCnts.add(blikeService.getLikeCnt(board.getBno()));
			boardCommentsList.add(bcommentService.getBoardComments(board.getBno()));
		}

		model.addAttribute("boards", boards);
		model.addAttribute("likeCnts", likeCnts);
		model.addAttribute("boardCommentsList", boardCommentsList);
		model.addAttribute("blikes",blikes);
		model.addAttribute("bookmarks",bookmarks);
		
		return "feed";
	}

	@RequestMapping("/commentWrite")
	public String commentWrite(HttpSession session, String ccomment,int bno, String mid, Model model, HttpServletResponse response) throws IOException, ServletException {
		
		Bcomment bcomment=new Bcomment();
		bcomment.setBno(bno);
		bcomment.setCcontent(ccomment);
		bcomment.setMid(mid);
		bcommentService.CommentsWrite(bcomment);
		
		List<Bcomment> boardCommentsListWrite = bcommentService.getBoardCommentsWrite(bno);
		
		model.addAttribute("boardCommentsListWrite", boardCommentsListWrite);
		return "commentHTML";
	}
	
	@RequestMapping("/LikeClick")
	public void LikeClick(int bno, String mid, HttpSession session, HttpServletResponse response,Model model) throws IOException, ServletException {
		
		Blike blike=new Blike();
		blike.setBno(bno);
		blike.setMid(mid);
		blikeService.likeClick(blike);
		
		int likeCntsClick=blikeService.countLikes(bno);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("likeCntsClick",likeCntsClick);
		String json = jsonObject.toString();
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/DisLikeClick")
	public void DisLikeClick(int bno, String mid, HttpSession session, HttpServletResponse response, Model model) throws IOException, ServletException {
		
		Blike blike=new Blike();
		blike.setBno(bno);
		blike.setMid(mid);
		blikeService.dislikeClick(blike);
		
		int likeCntsClick=blikeService.countLikes(bno);
		model.addAttribute("likeCntsClick", likeCntsClick);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("likeCntsClick",likeCntsClick);
		String json = jsonObject.toString();
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/BookmarkClick")
	public void BookmarKClick(int bno, String mid, HttpServletResponse response) throws IOException, ServletException {
		Bookmark bookmark=new Bookmark();
		bookmark.setBno(bno);
		bookmark.setMid(mid);
		bookmarkService.bookmarkClick(bookmark);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/DisBookmarkClick")
	public void DisBookmarkClick(int bno, String mid, HttpServletResponse response) throws IOException, ServletException {
		Bookmark bookmark=new Bookmark();
		bookmark.setBno(bno);
		bookmark.setMid(mid);
		bookmarkService.disbookmarkClick(bookmark);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();
		out.close();
	}
}