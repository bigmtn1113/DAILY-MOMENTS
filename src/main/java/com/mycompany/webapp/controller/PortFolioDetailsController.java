package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PortFolioDetailsController {
	//@Resource private XXXService xxxService;
	
	@GetMapping("/portfolioDetails")
	public String portfolioDetails() {
		return "portfolioDetails";
	}	
}