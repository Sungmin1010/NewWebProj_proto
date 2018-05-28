package com.spring.example;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int totalCount;//��ü�Խñ� ��
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum=10; //������ ���� ����.. UI���� �ϴܿ� ������ ������ ���� (1-10)or(1-5)(6-10)
	private Paging paging;//��������ȣ, �Խñ۴���, �ش����������۹�ȣ
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	
	private void calcData() {//UI���� �ϴܿ� ������ ������ �׺���̼ǰ� ���� �Ǿ� �ִ�.
		// �������� �� ���� �������� �ʰ� ����� ������ �� ������ ������ ��ȣ.. 10or20or30...
		endPage = (int) (Math.ceil(paging.getPage()/(double)displayPageNum) * displayPageNum);
		
		// �Խù��� ������ �������� �ʰ� ����� ���� ������... 1or 11or 21...
		startPage = (endPage - displayPageNum) + 1;
		
		// �Խù��� ������ �������� ���� ������ �� ������ ������ ��ȣ.. ��ü�Խñ���12�϶�.. 2�������� ������ ������... ��ü �Խñ��� 111���϶� 12�������� ������ ������
		int tempEndPage = (int)(Math.ceil(totalCount/(double)paging.getPerPageNum()));
		
		if(endPage > tempEndPage) {//���� ���� �������� 11������ �̸� endPage�� 20, tempEndPage�� 12�� �ȴ�.
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
