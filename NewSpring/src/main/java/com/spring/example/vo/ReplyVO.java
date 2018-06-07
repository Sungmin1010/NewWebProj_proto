package com.spring.example.vo;

import java.util.Date;

public class ReplyVO {
	
	private int rseq;
	private int bseq;
	private int useq;
	private String comment;
	private int rstatus;
	private Date datetime;
	private String nick;
	
	
	public ReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReplyVO(int rseq, int bseq, int useq, String comment, int rstatus, Date datetime, String nick) {
		super();
		this.rseq = rseq;
		this.bseq = bseq;
		this.useq = useq;
		this.comment = comment;
		this.rstatus = rstatus;
		this.datetime = datetime;
		this.nick = nick;
	}
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public int getUseq() {
		return useq;
	}
	public void setUseq(int useq) {
		this.useq = useq;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getRstatus() {
		return rstatus;
	}
	public void setRstatus(int rstatus) {
		this.rstatus = rstatus;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	@Override
	public String toString() {
		return "ReplyVO [rseq=" + rseq + ", bseq=" + bseq + ", useq=" + useq + ", comment=" + comment + ", rstatus="
				+ rstatus + ", datetime=" + datetime + ", nick="+nick+"]";
	}
	
	
	
	

}
