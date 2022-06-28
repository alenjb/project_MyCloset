package com.mycloset.member.vo;

import java.util.Date;

import lombok.Data;

@Data
public class LoginVO{
	
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_grade;
	private Date member_reg_date;
	//새로운 메시지를 저장하는 변수 ->서브 쿼리
	//메시지 시스템에서 새 메시지를 읽으면 세션에 있는 새 메시지 정보를 -1 처리를 해줘한다
//	private long newMessage;
}
