package com.mycloset.notice.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class NoticeVO {
	
	//공지 번호
	private long no;
	
	//공지 제목
	private String title;
	
	//공지 내용
	private String content;
	
	//공지 작성자
	private String writer;
	
	//공지 작성일
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date writeDate;
	
	//공지 마감일
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;
}
