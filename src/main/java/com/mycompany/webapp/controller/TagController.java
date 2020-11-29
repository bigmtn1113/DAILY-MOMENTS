package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TagController {
	private static final Logger logger = LoggerFactory.getLogger(TagController.class);
	
	//@Resource private XXXService xxxService;
	
	@RequestMapping("/tag")
	public String tag() {
		logger.info("실행");
		
		return "tag";
	}	
}