package com.mycloset.util;

import lombok.Data;

@Data
public class Critera {
	//현재 페이지 번호
	private int pageNum;
	//한 페이지에 몇개의 게시물을 보여줄지
	private int amount;
	//검색 종류(전체/ 제목/ 작성자 등)
	private String type;
	//검색어
	private String keyword;
	
	public Critera() {
		this(1, 10);
	}

	public Critera(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
		
	}
	
	
}
