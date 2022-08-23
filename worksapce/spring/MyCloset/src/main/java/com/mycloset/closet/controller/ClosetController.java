package com.mycloset.closet.controller;



import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.member.service.ClosetService;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.member.vo.MemberVO;
import com.mycloset.util.Critera;
import com.mycloset.util.PageDTO;

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
	
	//옷등록
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
		//옷 등록 작업
		service.enroll(vo);
		return "closet/list";	
	}

	//옷 리스트
	@GetMapping("/list")
	public void list(HttpServletRequest request, Critera cri, Model model) throws Exception{
		//로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO)session.getAttribute("login");
		//아이디 추출
		String memberId= loginVO.getMember_id();
		// 옷 리스트 가져오는 작업을 통해 closets에 리스트 형태로 저장(일단 임시로 0을 보냄)
		//0 자리는 아무 값이나 보내면 되서 0을 보냄
		List<ClosetVO> closets= service.getListWithPaging(cri, 0);
		closets.forEach(b -> log.info(b));
		//모델에 옷 리스트 담기
		model.addAttribute("closets", closets);
		//옷 총 개수 세기
		int totalNum= service.getTotalNum();
		//페이지 관련 정보 담기
		model.addAttribute("pageMaker", new PageDTO(cri, totalNum));
	}
	
	//옷 상세 보기
	@GetMapping("/view")
	public String view(Model model, @RequestParam("clothes_id") String clothes_id) throws Exception{
		model.addAttribute("vo", vo);
		model.addAttribute("list", service.view(""));
		return "closet/view";
	}
	//옷 수정 페이지
	@GetMapping("/update")
	public String UpdateForm(HttpServletRequest request, Model model) throws Exception{
		// 세션을 받기: 로그인 정보
		HttpSession session = request.getSession();
		//세션에서 로그인 정보를 빼서 LVO에 저장
		LoginVO LVO = (LoginVO)session.getAttribute("login");
		//사용자 아이디를 추춣
		String id = LVO.getMember_id();
		service.view(id);
//		model.addAttribute("VOs", ClosetVOs);
//		System.out.println("세션 "+session.getAttribute("memberVO"));
//		System.out.println("모델"+model);
//		System.out.println("closetVOs "+ClosetVOs);
//
//		//			service.update(vo);
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
