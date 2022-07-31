package com.mycloset.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.member.mapper.MemberMapper;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.member.vo.MemberVO;
import com.mycloset.notice.vo.NoticeVO;
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
	
	//비밀번호 찾기
	public String findPw(String id, String name, String email) throws Exception{
		return mapper.findPw(id, name, email);
	}

	
	//회원등급변경
	
	//마이 페이지 개인정보 보여주기(view)
	public MemberVO myPage(LoginVO vo) throws Exception{
		return mapper.myPage(vo);
	}
	
	//마이페이지 개인정보 수정
	public int update(MemberVO vo)throws Exception{
		System.out.println("MemberService.update().vo - "+vo);
		return mapper.update(vo);
	}
	
	//마이페이지 회원 탈퇴
	public int delete(MemberVO vo) throws Exception{
		System.out.println("MemberService.delete().vo - "+vo);
		return mapper.delete(vo);
	}
}
