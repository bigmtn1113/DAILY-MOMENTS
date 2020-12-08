package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FileDisplayController {
	@GetMapping("/displayMemberImg")
	public void displayMemberImg(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkspace/images/member/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);
		
		//응답 HTTP 헤더 구성
		//1)Content-Type 헤더 구성
		ServletContext application = request.getServletContext();
		String fileType = application.getMimeType(fileName);
		response.setContentType(fileType);
		
		//2)Content-Disposition 헤더 구성
		String originalFileName;
		try { originalFileName = fileName.split("_")[1];}
		catch (Exception e) { originalFileName = fileName;}
		
		originalFileName = new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");	//한글 아스키코드화
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\"");
		
		//3)Content-Length 헤더 구성(다운로드할 파일의 크기를 지정)
		int fileSize = (int)new File(saveFilePath).length();
		response.setContentLength(fileSize);
		
		//응답 HTTP의 바디(본문) 구성
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/displayBoardImg")
	public void displayBoardImg(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkspace/images/board/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);
		
		//응답 HTTP 헤더 구성
		//1)Content-Type 헤더 구성
		ServletContext application = request.getServletContext();
		String fileType = application.getMimeType(fileName);
		response.setContentType(fileType);
		
		//2)Content-Disposition 헤더 구성
		String originalFileName = fileName.split("_")[1];
		originalFileName = new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");	//한글 아스키코드화
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\"");
		
		//3)Content-Length 헤더 구성(다운로드할 파일의 크기를 지정)
		int fileSize = (int)new File(saveFilePath).length();
		response.setContentLength(fileSize);
		
		//응답 HTTP의 바디(본문) 구성
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();
	}
}
