package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.service.BoardService;
import com.mycompany.webapp.service.TagService;

@Controller
public class TagController {
	private static final Logger logger = LoggerFactory.getLogger(TagController.class);
	
	@Resource private TagService tagService;
	@Resource private BoardService boardService;
	
	@RequestMapping("/tag")
	public String tag(Model model) {
		String tname = "운동";
		int tagBoardCnt = tagService.getTagBoardCnt(tname);
		List<String> tagBoardPhotos = boardService.getTagBoardPhotos(tname);
		
		model.addAttribute("tagBoardCnt", tagBoardCnt);
		model.addAttribute("tagBoardPhotos", tagBoardPhotos);
		return "tag";
	}	
}