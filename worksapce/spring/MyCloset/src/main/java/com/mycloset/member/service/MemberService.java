package com.mycloset.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.member.mapper.MemberMapper;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.member.vo.MemberVO;

@Service
public class MemberService {
	
	//MemberMapper 주입
	@Inject
	private MemberMapper mapper;

//1. 회원가입 관련
	
	//1-1. 회원가입
	public int signUp(MemberVO vo) throws Exception{
		return mapper.signUp(vo);
	}
	
	//1-2. 아이디 중복체크
	public String idCheck(String id) throws Exception{
		String result= mapper.idCheck(id);
		//중복된 아이디가 있으면
		if (result !=null) {
			return "N";
		}else {	//중복된 아이디가 없으면
			return "Y";}		
	}
	
//2. 로그인 
	public LoginVO login(LoginVO vo) throws Exception{
		return mapper.login(vo);
	}
	
//3. 아이디찾기 및 비밀번호 찾기
	
	//3-1. 아이디 찾기
	public String findId(String name, String email) throws Exception{
		return mapper.findId(name, email);
	}
	
	//3-2. 비밀번호 찾기
	public String findPw(String id, String name, String email) throws Exception{
		return mapper.findPw(id, name, email);
	}

//4. 마이 페이지 
	
	//4-1. 마이페이지 개인정보 보여주기(view)
	public MemberVO myPage(LoginVO vo) throws Exception{
		return mapper.myPage(vo);
	}
	
	//4-2. 마이페이지 개인정보 수정
	public int update(MemberVO vo)throws Exception{
		return mapper.update(vo);
	}
	
	//4-3. 마이페이지 회원 탈퇴
	public int delete(MemberVO vo) throws Exception{
		return mapper.delete(vo);
	}
}
