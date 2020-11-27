package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private String mid;
	private String mname;
	private String mpassword;
	private String mtel;
	private String mintroduce;
	private boolean msex;
	private String mphoto;
	private boolean menabled;
	private MultipartFile attachMphoto;
	
	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMpassword() {
		return mpassword;
	}

	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}

	public String getMintroduce() {
		return mintroduce;
	}

	public void setMintroduce(String mintroduce) {
		this.mintroduce = mintroduce;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public boolean isMsex() {
		return msex;
	}

	public void setMsex(boolean msex) {
		this.msex = msex;
	}

	public boolean isMenabled() {
		return menabled;
	}

	public void setMenabled(boolean menabled) {
		this.menabled = menabled;
	}

	public String getMphoto() {
		return mphoto;
	}

	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}
	
	public MultipartFile getAttachMphoto() {
		return attachMphoto;
	}

	public void setAttachMphoto(MultipartFile attachMphoto) {
		this.attachMphoto = attachMphoto;
	}
}
