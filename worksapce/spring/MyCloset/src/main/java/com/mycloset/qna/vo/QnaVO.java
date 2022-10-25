package com.mycloset.qna.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class QnaVO {
	
	//qna 번호
	private long no;
	
	//질문 제목
	private String qTitle;
	
	//질문 내용
	private String qContent;
	
	//질문 작성자
	private String qWriter;
		
	//질문 작성일
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date qDate;
	//질문 사진 주소
	private String qImage;
	//질문 사진 파일
	private MultipartFile qPhotoFile;
	
	//답변 제목
	private String aTitle;
		
	//답변 내용
	private String aContent;
		
	//답변 작성자
	private String aWriter;
			
	//답변 작성일
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date aDate;
	//답변 사진 주소
	private String aImage;
	//답변 사진 파일
	private MultipartFile aPhotoFile;	
	
}
