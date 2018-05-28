package com.spring.example.vo;

import java.sql.Date;
import java.util.Arrays;

public class BoardFileVO {
	private int bseq;
	private String title;//
	private String content;//
	private Date datetime;
	private int bstatus;
	private int hit;//
	private int useq;//
	private String[] files;
	public BoardFileVO() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public int getBstatus() {
		return bstatus;
	}
	public void setBstatus(int bstatus) {
		this.bstatus = bstatus;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getUseq() {
		return useq;
	}
	public void setUseq(int useq) {
		this.useq = useq;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "BoardFileVO [bseq=" + bseq + ", title=" + title + ", content=" + content + ", datetime=" + datetime
				+ ", bstatus=" + bstatus + ", hit=" + hit + ", useq=" + useq + ", files=" + Arrays.toString(files)
				+ "]";
	}
	
	
	

}
