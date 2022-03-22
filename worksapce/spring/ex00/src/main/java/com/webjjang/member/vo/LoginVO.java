package com.webjjang.member.vo;

import lombok.Data;

/**
 * 로그인 정보를 저장하는 객체
 * 아이디, 비밀번호, 이름, 등급번호, 등급명
 */
//롬복 라이브러리가 정상적으로 등록이 되서 실행되어야 한다.
@Data
public class LoginVO {

	// 필드선언 = 변수
	private String id;
	private String pw;
	private String name;
	private String photo;
	private int gradeNo;
	private String gradeName;
	
	//새로운 메시지를 저장하는 변수 -> 서브쿼리
	//메시지 시스템에서 새 메시지를 읽으면 세션에 있는 새메시지 정보를 -1처리를 해줘야한다.
	private long newMessage;
}
