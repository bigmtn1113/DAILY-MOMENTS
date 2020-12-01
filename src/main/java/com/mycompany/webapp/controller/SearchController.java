package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.SearchService;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Resource 
	private SearchService searchService;
	
	@GetMapping("/searchId")
	public String searchId(String searchedId, Model model) {
		model.addAttribute("searchedId", searchedId);
			
		return "atSign";
	}

}