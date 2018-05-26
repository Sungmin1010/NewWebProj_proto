package com.spring.example;

public class Paging {
	private int page;
	private int perPageNum;
	
	
	public Paging() {
		this.page = 1;
		this.perPageNum=10;
		// TODO Auto-generated constructor stub
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<=0) {
			this.page=1;
			return;
		}
		this.page=page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum >100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	public int getPageStart() {
		return (this.page-1) * perPageNum;
	}
	@Override
	public String toString() {
		return "Paging [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	

	
	
	
	
	
	
	

}
