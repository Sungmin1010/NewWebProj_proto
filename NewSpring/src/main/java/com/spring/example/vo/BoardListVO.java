package com.spring.example.vo;

import java.sql.Date;

public class BoardListVO {
	private int bseq;
	private String title;
	private String content;
	
	private Date datetime;
	//private int bstatus;
	private int hit;
	private String nick;
	public BoardListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardListVO(int bseq, String title, String content, Date datetime, int hit, String nick) {
		super();
		this.bseq = bseq;
		this.title = title;
		this.content = content;
		this.datetime = datetime;
		this.hit = hit;
		this.nick = nick;
	}
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "BoardListVO [bseq=" + bseq + ", title=" + title + ", content=" + content + ", datetime=" + datetime + ", hit=" + hit + ", nick="
				+ nick + "]";
	}
	
	

}
