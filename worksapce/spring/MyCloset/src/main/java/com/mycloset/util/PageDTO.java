package com.mycloset.util;

import lombok.Data;

@Data
public class PageDTO {
	
	// 시작 페이지 번호
	private int startPage;
	// 끝 페이지 번호
	private int endPage;
	// 앞. 뒤로 이동할 수 있는지(데이터가 앞페이지나 뒷페이지에 더 있는지)
	private boolean prev, next;
	
	//총 데이터 개수
	private int total;
	//검색관련 정보 및 한페이지당 보여줄 개수가 담긴 객체
	private Critera cri;
	
	public PageDTO(Critera cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//페이징 끝번호 계산
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		//페이징 시작번호 계산
		this.startPage= this.endPage - 9;
		
		//total을 통한 endPage 재계산
			// 만약 endPage * 한페이지에 보여주는 데이터의 개수 > 실제 데이터의 개수  이면 다시 계산해야함.
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		//실제 데이터 개수가 endPage보다 모자라면
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		//앞으로 갈 수 있는지
		this.prev = this.startPage > 1;
		//뒤로 갈 수 있는지
		this.next = this.endPage < realEnd;
	}
}
