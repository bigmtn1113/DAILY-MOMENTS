package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PortFolioDetailsController {
	private static final Logger logger = LoggerFactory.getLogger(PortFolioDetailsController.class);
	
	//@Resource private XXXService xxxService;
	
	@GetMapping("/portfolioDetails")
	public String portfolioDetails() {
		logger.info("실행");
		
		return "portfolioDetails";
	}	
}