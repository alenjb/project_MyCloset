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

import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.fitting.service.FittingService;
import com.mycloset.fitting.vo.FittingVO;
import com.mycloset.fitting.vo.ImageVO;
import com.mycloset.member.vo.LoginVO;

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
		service.enroll(vo);
		
		return "redirect:list";
	}

	// 2. 피팅 리스트

	// 3. 피팅 세부 보기

	// 4. 피팅 수정
	// 4-1. 피팅 수정 폼
	// 4-2. 피팅 수정

	// 5. 피팅 삭제
}
