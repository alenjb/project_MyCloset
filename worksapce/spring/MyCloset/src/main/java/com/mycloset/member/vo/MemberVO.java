package com.mycloset.member.vo;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {
	private int member_key;
	private String member_id;
	private String member_pw;
	private String member_name; 
	private String member_sex;
	
	//날짜형 입력을 받을 떄 문자열로 들어오므로 패턴을 지정해서 정의해 놓으면 Date 객체로 만들 때 사용한다.
	@DateTimeFormat(pattern= "yyyy-MM-dd")
	private Date member_birth_date;
	private String member_phone;
	private String member_email;
	private int member_height;
	private int member_top_size;
	private int member_bottom_size;
	private int member_shoes_size;
	private Date regDate;
	private String member_grade;
	private String member_face;
	
	//사용자가 올린 사진을 저장하는 변수
	//회원가입 폼의 jsp에서 name="photoFile"로 준다.
	//post이고 enctype="multipart/form-data" 지정해야만한다.
	private MultipartFile photoFile;
	
	
	}
	
