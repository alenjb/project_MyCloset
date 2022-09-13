package com.mycloset.fitting.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycloset.fitting.service.FittingService;
import com.mycloset.fitting.vo.FittingVO;
import com.mycloset.fitting.vo.ImageVO;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.util.Critera;
import com.mycloset.util.PageDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/fitting")
@Log4j
public class FittingController {
	@Inject
	FittingService service;

	// 1. 피팅 등록
	// 1-1. 피팅 등록 폼
	@GetMapping("/enroll")
	public String enrollForm(HttpServletRequest request, Model model) throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		// 아이디 추출
		String memberId = loginVO.getMember_id();
		//폼에 보여줄 이미지들 가져오기
		System.out.println("아이디: "+memberId+"----------------------");
		List<ImageVO> list= service.getImages(memberId);
		// 모델에 리스트 담기
		model.addAttribute("list", list);
		System.out.println("리스트: "+list);
		return "fitting/enroll";
	}

	// 1-2. 피팅 등록
	@PostMapping("/enroll")
	public String enroll(HttpServletRequest request, FittingVO vo, Model model) throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		// 아이디 추출
		String memberId = loginVO.getMember_id();
		// 모델에 아이디 담기
		model.addAttribute("member_id", memberId);
		System.out.println("vo: "+vo);
		service.enroll(vo);
		
		return "redirect:list";
	}

	// 2. 피팅 리스트
	@GetMapping("/list")
	public void list(HttpServletRequest request, Critera cri, Model model) throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		// 아이디 추출
		String memberId = loginVO.getMember_id();
		// 옷 리스트 가져오는 작업을 통해 closets에 리스트 형태로 저장(일단 임시로 0을 보냄)
		// 0 자리는 아무 값이나 보내면 되서 0을 보냄
		List<FittingVO> fittings = service.getListWithPaging(cri, 0);
//		closets.forEach(b -> log.info(b));
//		log.info(closets);
		// 모델에 피팅 리스트 담기
		model.addAttribute("fittings", fittings);
		// 옷 피팅 개수 세기
		int totalNum = service.getTotalNum();
		// 페이지 관련 정보 담기
		model.addAttribute("pageMaker", new PageDTO(cri, totalNum));
	}
	
	// 3. 피팅 세부 보기
	@GetMapping("/view")
	public String view(HttpServletRequest request, Model model, @RequestParam("fitting_id")String fitting_id) throws Exception{
		//로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO)session.getAttribute("login");
		//아이디 추출
		String memberId= loginVO.getMember_id();
		//모델에 피팅 아이디 추가
		model.addAttribute("fitting_id", fitting_id);
		int cId = Integer.parseInt(fitting_id);
		//서비스에서 view 메서드 호출
		FittingVO vo= service.view(memberId, cId);
		model.addAttribute("vo", vo);
		return "fitting/view";
	}
	// 4. 피팅 수정
	// 4-1. 피팅 수정 폼
	// 4-2. 피팅 수정

	// 5. 피팅 삭제
}
