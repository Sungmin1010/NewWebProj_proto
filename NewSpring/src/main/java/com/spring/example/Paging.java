package com.spring.example;

public class Paging {//Paging Class = {page(��������ȣ), perPageNum(������Խù���)}
	private int page; //��ü ������ �⺻�� -> 1
	private int perPageNum;//��ü ������ �⺻�� -> 10
	
	
	public Paging() {
		this.page = 1;
		this.perPageNum=10;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {//URL �Ķ������� ��Ʈ�ѷ��� ���� ���޵� ��� setPage()����
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
	public int getPageStart() {//page��ȣ�� �Խù� ������ ���� �ش� �������� ù �Խù��� �޶�����.
		return (this.page-1) * perPageNum;  //sql ������ ������ ����ϰ� �ȴ�.
	}
	@Override
	public String toString() {
		return "Paging [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	

	
	
	
	
	
	
	

}
