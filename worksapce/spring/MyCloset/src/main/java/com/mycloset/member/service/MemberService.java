package com.mycloset.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.member.mapper.MemberMapper;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.member.vo.MemberVO;
import com.webjjang.util.PageObject;

@Service
public class MemberService {
	
	//MemberMapper 주입
	@Inject
	private MemberMapper mapper;
	
	//회원가입 폼
	public int signUp(MemberVO vo) throws Exception{
		return mapper.signUp(vo);
	}
	
	//회원가입
	
	
	//로그인 
	public LoginVO login(LoginVO vo) throws Exception{
		return mapper.login(vo);
	}
	
	//회원 리스트
	public List<MemberVO> list(PageObject object) throws Exception{
		object.setTotalRow(mapper.getTotalRow(object));
		return mapper.list(object);
	}
	//회원정보보기 / 내정보보기

	//아이디 찾기
	public String findId(String name, String email) throws Exception{
		return mapper.findId(name, email);
	}

	
	//회원등급변경
}
