package com.mycloset.member.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycloset.member.service.MemberService;
import com.mycloset.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	//MemberService 주입
	@Inject
	private MemberService service;
	
	//회원가입 폼
	@GetMapping("/signUp")
	public String signUpForm() throws Exception{
		return "member/signUp";	
	}
	
	//회원가입
	@PostMapping("/signUp")
	public String signUp(MemberVO vo) throws Exception{
		service.signUp(vo);
		return "member/list";	
	}

	
	//회원가입 시 아이디 중복체크
	public String idCheck(String id, Model model) throws Exception{
		return "member/idCheck";
	}
	//회원가입
	
	//로그인 폼
	
	//로그인 
	
	//로그아웃
	
	//회원 리스트
	
	//회원정보보기 / 내정보보기
	
	//회원등급변경
	
	//홈
	@GetMapping("/signUp3")
	public String signUp3() throws Exception{
		return "member/signUp3";
	}
}
