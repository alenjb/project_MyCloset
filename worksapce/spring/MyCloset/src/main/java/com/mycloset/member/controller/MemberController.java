package com.mycloset.member.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycloset.member.service.MemberService;
import com.mycloset.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;






@Log4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	//자동 DI
	@Autowired
	private MemberService service;
	
	//0.list
	@GetMapping("/list.do")
	public String list(Model model) throws Exception{
		model.addAttribute("list", service.list());
		System.out.println("boardController.list()");
		return "board/list";
	}
	
	//1. 회원가입
	@GetMapping("/write.do")
	public String writeForm(MemberVO vo) throws Exception{
		System.out.println("회원가입 페이지");
		return "member/write";
	}
	//2. 로그인
	
	//3.아이디, 비밀번호 찾기
	
	//4. 마이페이지
	
}
