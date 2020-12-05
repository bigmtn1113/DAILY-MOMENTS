package com.mycompany.webapp.dto;

import java.util.Date;

public class Blike {
	private int bno;
	private String mid;
	private Date ldate;
	
	public Blike(int bno, String mid) {
		this.bno = bno;
		this.mid = mid;
	}
	
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
	public Date getLdate() {
		return ldate;
	}
	public void setLdate(Date ldate) {
		this.ldate = ldate;
	}
}
