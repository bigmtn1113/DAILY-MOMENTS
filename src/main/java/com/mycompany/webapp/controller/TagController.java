package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.TagService;

@Controller
public class TagController {
	@Resource private TagService tagService;
	@Resource private BoardService boardService;
	
	@RequestMapping("/tag")
	public String tag(String searchedTag, Model model) {
		int tagBoardCnt = tagService.getTagBoardCnt(searchedTag);
		List<String> tagBoardPhotos = boardService.getTagBoardPhotos(searchedTag);
		
		model.addAttribute("searchedTag", searchedTag);
		model.addAttribute("tagBoardCnt", tagBoardCnt);
		model.addAttribute("tagBoardPhotos", tagBoardPhotos);
		return "tag";
	}	
}