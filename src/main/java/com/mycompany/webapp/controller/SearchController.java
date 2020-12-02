package com.mycompany.webapp.controller;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.service.MemberService;
import com.mycompany.webapp.service.TagService;

@Controller
public class SearchController {
	@Resource MemberService memberService;
	@Resource TagService tagService;
	
	@RequestMapping("/searchId")
	public void searchId(String searchedId, HttpServletResponse response) throws Exception {
		String mid = memberService.getMid(searchedId);
		
		JSONObject jsonObject = new JSONObject();
		if (mid != null) jsonObject.put("result", "success");
		else jsonObject.put("result", "fail");
		String json = jsonObject.toString();
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/searchTag")
	public void searchTag(String searchedTag, HttpServletResponse response) throws Exception {
		String tag = tagService.getTag(searchedTag);
		
		JSONObject jsonObject = new JSONObject();
		if (tag != null) jsonObject.put("result", "success");
		else jsonObject.put("result", "fail");
		String json = jsonObject.toString();
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
}
