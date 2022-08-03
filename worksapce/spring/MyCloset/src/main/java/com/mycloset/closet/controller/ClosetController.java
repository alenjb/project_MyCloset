package com.mycloset.closet.controller;



import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.member.service.ClosetService;
import com.mycloset.member.vo.MemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/closet")
@Log4j
public class ClosetController {
	
	//ClosetService 주입
	@Inject
	private ClosetService service;
	
	//옷등록 페이지 폼
	@GetMapping("/enroll")
	public String enrollForm() throws Exception{
		return "closet/enroll";	
	}
	
	//옷등록 페이지
	@PostMapping("/enroll")
	public String enroll(ClosetVO vo) throws Exception{
		MultipartFile file =vo.getClothes_photo_file();
		String uploadFolder = "D:\\jeongbin\\worksapce\\spring\\MyCloset\\src\\main\\webapp\\upload\\closet";
		File saveFile = new File(uploadFolder, file.getOriginalFilename());
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		vo.setClothes_photo("\\upload\\closet\\"+file.getOriginalFilename());
		service.enroll(vo);
		return "closet/view";	
	}

		
	
//	
//	//회원 리스트
//	//관리자만 볼 수 있음
//	@GetMapping("/list")
//	public String list(@ModelAttribute PageObject object, Model model, HttpSession session) throws Exception{
//		model.addAttribute("list",service.list(object));
//		return "member/list";
//		
//	} 
//	//회원정보보기 / 내정보보기
//	
//	//회원등급변경
//	
	//view
	@GetMapping("/view")
	public String view(Model model, ClosetVO vo) throws Exception{
		model.addAttribute("vo", vo);
		model.addAttribute("list", service.view(""));
		return "closet/view";
	}
//	
//	
	//마이 페이지 수정
	@GetMapping("/update")
	public String UpdateForm(HttpServletRequest request, ClosetVO vo, Model model) throws Exception{
		HttpSession session = request.getSession();
//			service.update(vo);
		return "closet/update";
	}
//	  //마이 페이지 수정
//	  
//  @PostMapping("/myPage/update") 
//  public String myPageUpdate(MemberVO vo, HttpServletRequest request) throws Exception{   
//	  service.update(vo);
//	  return "member/myPage"; 
//	  }
//  
//  @GetMapping("/myPage/delete")
//  public String myPageDelete(HttpServletRequest request) throws Exception{
//	  MemberVO vo = (MemberVO)request.getSession().getAttribute("memberVO");
//	  service.delete(vo);
//	  request.getSession().removeAttribute("login");
//	  System.out.println("제거한 후 세션 "+request.getSession());
//
//	  return "redirect:/member/login";
//  }
//  
  
		
}
