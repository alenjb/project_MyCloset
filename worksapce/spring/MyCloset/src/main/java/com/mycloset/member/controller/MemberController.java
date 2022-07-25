package com.mycloset.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycloset.member.service.MemberService;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.member.vo.MemberVO;
import com.webjjang.util.PageObject;

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
	@GetMapping("/idCheck")
	public String idCheck(String id, Model model) throws Exception{
		return "member/idCheck";
	}
	
	
	//로그인 폼
	@GetMapping("/login")
	public String loginForm() throws Exception{
		log.info("로그인 폼으로 이동");
		return "member/login";
	}
	//로그인
	@PostMapping("/login")
	public String login(LoginVO vo, HttpSession session, Model model) throws Exception{
		if(service.login(vo) != null) {
			session.setAttribute("login",service.login(vo));
			log.info("로그인처리  vo: "+service.login(vo));
			model.addAttribute("vo", service.login(vo));
			return "member/home";}
		else {
			log.info("로그인 할 수 없음");
			return "redirect:/member/login";
		}
	}
	//로그아웃
	@GetMapping("/logut")
	public String logut(LoginVO vo, HttpSession session) throws Exception{
		session.removeAttribute("login");
		log.info("로그아웃처리  vo: "+service.login(vo));
		return "member/login";
	}
	
	//회원 리스트
	//관리자만 볼 수 있음
	@GetMapping("/list")
	public String list(@ModelAttribute PageObject object, Model model, HttpSession session) throws Exception{
		model.addAttribute("list",service.list(object));
		return "member/list";
		
	} 
	//회원정보보기 / 내정보보기
	
	//회원등급변경
	
	//아이디 찾기 폼
	@GetMapping("/findId")
	public String findIdForm() throws Exception{
		
		log.info("아이디 찾기 폼으로 이동");
		return "member/findId";
	}
	
	//아이디 찾기
	@PostMapping("/findId")
	@ResponseBody
	public Map<String, Object> findId(String name, String email) throws Exception{
		Map<String, Object> jsonData = new HashMap<>();
		String id = service.findId(name, email);
		if(service.findId(name, email) != null) {
			log.info("아이디 찾기 성공");
			jsonData.put("id", id);
		}
		log.info(id);
		log.info(jsonData);
		return jsonData;
	}
	

	//비밀번호 찾기 폼
	@GetMapping("/findPw")
	public String findPwForm() throws Exception{
		log.info("비밀번호 찾기 폼으로 이동");
		return "member/findPw";
	}

	//비밀번호 찾기
	@PostMapping("/findPw")
	@ResponseBody
	public Map<String, Object> findPw(String id, String name, String email) throws Exception{
		Map<String, Object> jsonData = new HashMap<>();
		String pw = service.findPw(id, name, email);
		log.info(pw+"이거");
		
		if(service.findPw(id, name, email) != null) {
			log.info("비밀번호 찾기 성공");
			jsonData.put("pw", pw);
		}
		log.info(jsonData);
		return jsonData;
	}
	
	//홈
	@GetMapping("/home")
	public String home() throws Exception{
		return "member/home";
	}
	
}
