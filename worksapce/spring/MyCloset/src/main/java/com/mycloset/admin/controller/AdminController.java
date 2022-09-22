package com.mycloset.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycloset.admin.service.AdminService;
import com.mycloset.admin.vo.AdminVO;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.util.Critera;
import com.mycloset.util.PageDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	// MemberService 주입
	@Inject
	private AdminService service;

	// 회원 리스트
	// 관리자만 볼 수 있음
	@GetMapping("/list")
	public String list(HttpServletRequest request, Critera cri, Model model) throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		// 아이디 추출
		String memberId = loginVO.getMember_id();
		// 리스트 가져오기
		List<AdminVO> lists = service.getListWithPaging(cri, 0);
		model.addAttribute("lists", lists);
		// 전체 개수 세기
		int totalNum = service.getTotalNum();
		// 페이지 관련 정보 담기
		model.addAttribute("pageMaker", new PageDTO(cri, totalNum));
		return "admin/list";

	}
	// 회원정보보기 / 내정보보기

	// 회원등급변경

}
