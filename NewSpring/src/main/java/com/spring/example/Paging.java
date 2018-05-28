package com.spring.example;

public class Paging {//Paging Class = {page(페이지번호), perPageNum(단위당게시물수)}
	private int page; //객체 생성시 기본값 -> 1
	private int perPageNum;//객체 생성시 기본값 -> 10
	
	
	public Paging() {
		this.page = 1;
		this.perPageNum=10;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {//URL 파람값으로 컨트롤러에 값이 전달될 경우 setPage()실행
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
	public int getPageStart() {//page번호와 게시물 단위에 따라 해당 페이지의 첫 게시물이 달라진다.
		return (this.page-1) * perPageNum;  //sql 쿼리문 날릴때 사용하게 된다.
	}
	@Override
	public String toString() {
		return "Paging [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	

	
	
	
	
	
	
	

}
