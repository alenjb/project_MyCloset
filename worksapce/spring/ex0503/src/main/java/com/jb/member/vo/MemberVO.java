package com.jb.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO{
	
	private String id;
	private String password;
	private String name;
	private String sex;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	private String phone;
	//자동 캐스팅 되어서 date format 지정 안해도 됨
	private String email;
	private int height;
	private int topsize;
	private int bottomsize;
	private int shoessize;
	private String face;
	private Date regDate;
	private String gradeName;
	private int gradeNo;
	//사용자가 올린 사진을 저장하는 변수
	//회원가입 폼의 jsp에서 name="photoFile"로 준다
	//post이고 enctype="multiPart/form-data"로 지정해야만 한다
	private MultipartFile faceFile;

	
	
}
