package com.mycloset.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.member.mapper.MemberMapper;
import com.mycloset.member.vo.MemberVO;

@Service
public class MemberService {
	
	//MemberMapper 주입
	@Inject
	
	private MemberMapper mapper;
	//회원가입 폼
	public int signUp(MemberVO vo) throws Exception{
		return mapper.signUpForm(vo);
	}
	//회원가입 시 아이디 중복체크
	
	//회원가입
	
	//로그인 폼
	
	//로그인 
	
	//로그아웃
	
	//회원 리스트
	
	//회원정보보기 / 내정보보기
	
	//회원등급변경
}
