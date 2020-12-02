package com.mycompany.webapp.dto;

import java.util.Date;

public class Bookmark {
	private int bno;
	private String mid;
	private Date bmdate;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getBmdate() {
		return bmdate;
	}
	public void setBmdate(Date bmdate) {
		this.bmdate = bmdate;
	}
}
