package com.jb.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;

import com.jb.member.service.MemberService;
import com.jb.member.vo.LoginVO;
import com.jb.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	//자동 DI
	@Autowired
	private MemberService service;
	
	//로그인
	
	//1. 로그인 폼
	@GetMapping("/login.do")
	public String loginForm() {
		log.info("로그인 폼으로 이동");
		
		return "member/login";
	}
	
	//2. 로그인
	@PostMapping("/login.do")

	public String login(LoginVO invo, HttpSession session) throws Exception{
		log.info("로그인 처리 - invo: "+invo);
		session.setAttribute("login", service.login(invo));
		return "redirect:/board/list.do";
	}
	
	
	//로그 아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		//session의 정보를 지운다.
		session.removeAttribute("login");
		log.info("로그아웃");
		
		return "redirect:/board/list.do";
		
	}
	
	//회원가입 폼
	@GetMapping("/write.do")
	public String writeForm(MemberVO vo) throws Exception{
		return "member/write";
		
	}
	
	//회원가입 처리
	@PostMapping("/write.do")
	public String write(MemberVO vo) throws Exception{
		System.out.println(vo);
		//service.write(vo);
		return "redirect:/member/login.do";
		
	}
	
	//아이디 중복체크
	@GetMapping("/idCheck")
	public String idCheck(String id, Model model) throws Exception{
		
		model.addAttribute("id", service.idCheck(id));
		return "member/idCheck";
		
	}
}	
