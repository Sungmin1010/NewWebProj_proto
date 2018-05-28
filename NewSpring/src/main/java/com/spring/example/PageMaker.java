package com.spring.example;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int totalCount;//전체게시글 수
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum=10; //페이지 수의 단위.. UI에서 하단에 보여질 페이지 갯수 (1-10)or(1-5)(6-10)
	private Paging paging;//페이지번호, 게시글단위, 해당페이지시작번호
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	
	private void calcData() {//UI에서 하단에 보여질 페이지 네비게이션과 관련 되어 있다.
		// 페이지의 총 합을 생각하지 않고 계산한 페이지 수 단위의 마지막 번호.. 10or20or30...
		endPage = (int) (Math.ceil(paging.getPage()/(double)displayPageNum) * displayPageNum);
		
		// 게시물의 총합을 생각하지 않고 계산한 시작 페이지... 1or 11or 21...
		startPage = (endPage - displayPageNum) + 1;
		
		// 게시물의 총합을 생각했을 때의 페이지 수 단위의 마지막 번호.. 전체게시글이12일때.. 2페이지가 마지막 페이지... 전체 게시글이 111개일때 12페이지가 마지막 페이지
		int tempEndPage = (int)(Math.ceil(totalCount/(double)paging.getPerPageNum()));
		
		if(endPage > tempEndPage) {//만약 현재 페이지가 11페이지 이면 endPage는 20, tempEndPage는 12가 된다.
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * paging.getPerPageNum() >= totalCount ? false:true;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
										.queryParam("page", page)
										.queryParam("perPageNum", paging.getPerPageNum())
										.build();
		return uriComponents.toUriString();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public Paging getPaging() {
		return paging;
	}
	
	

}
