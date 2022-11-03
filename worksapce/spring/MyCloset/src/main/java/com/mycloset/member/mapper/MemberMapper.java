package com.mycloset.member.mapper;

import org.apache.ibatis.annotations.Param;

import com.mycloset.member.vo.LoginVO;
import com.mycloset.member.vo.MemberVO;

public interface MemberMapper {

//1. 회원가입 관련
	
	//1-1. 회원가입
	public int signUp(MemberVO vo) throws Exception;
	
	//1-2. 아이디 중복체크
	public String idCheck(String id) throws Exception;
	
//2. 로그인 
	public LoginVO login(LoginVO vo) throws Exception;
	
//3. 아이디찾기 및 비밀번호 찾기
	//3-1. 아이디 찾기
	public String findId(@Param("name")String name, @Param("email")String email) throws Exception;
	
	//3-2. 비밀번호 찾기
	public String findPw(@Param("id")String id, @Param("name")String name, @Param("email")String email) throws Exception;

//4. 마이 페이지 
	//4-1. 마이페이지 개인정보 보여주기(view)
	public MemberVO myPage(LoginVO vo) throws Exception;

	//4-2. 마이페이지 개인정보 수정(update)
	public int update(MemberVO vo) throws Exception;

	//4-3. 마이페이지 회원 탈퇴(update)
	public int delete(MemberVO vo) throws Exception;
}
