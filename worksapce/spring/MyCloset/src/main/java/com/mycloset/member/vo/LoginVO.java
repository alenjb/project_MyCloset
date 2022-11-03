package com.mycloset.member.vo;

import java.util.Date;

import lombok.Data;

@Data
public class LoginVO{
	// 아이디
	private String member_id;
	
	//비밀번호
	private String member_password;
	
	//이름
	private String member_name;
	//회원등급
	private String member_grade;
	//가입 날짜
	private Date member_reg_date;
	//프로필 사진
	private String member_face;
}
