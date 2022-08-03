package com.jb.member.controller;



import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jb.member.service.MemberService;
import com.jb.member.vo.LoginVO;
import com.jb.member.vo.MemberVO;
import com.webjjang.util.PageObject;

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
		log.info("로그인 처리 - invo: "+service.login(invo));
		session.setAttribute("login", service.login(invo));
		return "redirect:/member/list.do";
	}
	
	
	//로그 아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		//session의 정보를 지운다.
		session.removeAttribute("login");
		log.info("로그아웃");
		
		return "redirect:/board/list.do";
		
	}
	
	//회원리스트 - 관리자만 가능
	@GetMapping("/list.do")
	//@ModelAttribute  <-이거를 통해 모델에 담을 수 있다, jsp까지 전달한다.
	public String list(@ModelAttribute PageObject pageObject, Model model, HttpSession session) throws Exception{
		model.addAttribute("list", service.list(pageObject));
		System.out.println("로그인:"+session.getAttribute("login"));
//		System.out.println("넘어노는 vo   \n"+model.toString());
		return "member/list";
	}
	
	
	//회원 정보 보기 / 내 정보 보기
	@GetMapping("/view.do")
	public String view(String id, Model model, HttpSession session) throws Exception{
		if(id == null) {
			model.addAttribute("title", "내 정보 보기");
			id= ((LoginVO)session.getAttribute("login")).getId();
			System.out.println("\n  id: "+id);
		}else {
			model.addAttribute("title", "회원 정보 보기");}
			System.out.println("\n  회원정보보기: 아이디: "+id);
		model.addAttribute("vo", service.view(id));
		return "member/view";
		
	}
	
	
	//회원가입 폼
	@GetMapping("/write.do")
	public String writeForm() throws Exception{
		return "member/write";
		
	}
	
	//회원가입 처리
	@PostMapping("/write.do")
	public String write(MemberVO vo, HttpServletRequest request) throws Exception{
		MultipartFile uploadFile=vo.getFaceFile();
		String uploadFolder = "D:\\jeongbin\\worksapce\\spring\\ex0503\\src\\main\\webapp\\upload\\member";
		File saveFile = new File(uploadFolder, uploadFile.getOriginalFilename());
		try {
			uploadFile.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		service.write(vo);
		System.out.println(vo.toString());
		return "redirect:/member/login.do";
		
	}
	
	//아이디 중복체크
	@GetMapping("/idCheck")
	public String idCheck(String id, Model model) throws Exception{
		
//		model.addAttribute("id", service.idCheck(id));
		return "member/idCheck";
		
	}
	//등급변경
	@PostMapping("/changeGradeNo.do")
public String changeGradeNo(PageObject pageObject, MemberVO vo) throws Exception{
		//db에서 등급을 변경시킨다.
		service.changeGradeNo(vo);
		return "redirect:view.do?id="+vo.getId()+"&page="+pageObject.getPage()+"&perPageNum="+pageObject.getPerPageNum();
	}

}	