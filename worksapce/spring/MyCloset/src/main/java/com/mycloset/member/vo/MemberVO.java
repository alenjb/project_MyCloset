package com.mycloset.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class MemberVO {

	//회원 아이디
	private String member_id;
	
	//회원 비밀번호
	private String member_password;
	
	//회원 이름
	private String member_name;
	
	//회원 성별
	private String member_sex;
	
//	//회원 생년월일
//	@DateTimeFormat(pattern="yyyy-MM-dd")
//	private Date member_birthday;
	
	//회원 전화번호
	private String member_phone;
	
	//회원 이메일
	private String member_email;
	
	//회원 키
	private int member_height;
	
	//회원 상체 사이즈
	private int member_top_size;
	
	//회원 하체 사이즈
	private int member_bottom_size;
	
	//회원 신발 사이즈
	private int member_shoes_size;
	
	//회원 얼굴 사진 주소
	private String member_face;
	
	//회원 얼굴 사진 저장 변수
	private MultipartFile member_faceFile;
	
	//회원 가입 날짜
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date member_reg_date;
	
	//회원 등급
	private String member_grade;
	
	//회원 상태
	private String member_status;
}
