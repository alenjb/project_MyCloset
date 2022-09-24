package com.mycloset.admin.controller;

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

import com.mycloset.admin.service.AdminService;
import com.mycloset.admin.vo.AdminVO;
import com.mycloset.closet.vo.ClosetVO;
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
		//관리자일 경우에만 접근 가능
			//등급 추출
		String memberGrade = loginVO.getMember_grade();
			//관리자인지 확인
		if(memberGrade.equals("관리자")) {
			// 리스트 가져오기
			List<AdminVO> lists = service.getListWithPaging(cri, 0);
			model.addAttribute("lists", lists);
			// 전체 개수 세기
			int totalNum = service.getTotalNum();
			// 페이지 관련 정보 담기
			model.addAttribute("pageMaker", new PageDTO(cri, totalNum));
			return "admin/list";			
		}
		else {
			return "member/home";
		}

	}
	// 회원정보보기 / 내정보보기
	@GetMapping("/view")
	public String view(HttpServletRequest request, Model model, @RequestParam("member_id")String member_id) throws Exception{
		//로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO)session.getAttribute("login");
		//아이디 추출
		String loginId= loginVO.getMember_id();
		//모델에 조회할 회원 아이디 추가
		model.addAttribute("member_id", member_id);
		//서비스에서 view 메서드 호출
		AdminVO vo= service.view(member_id);
		model.addAttribute("vo", vo);
		return "admin/view";
	}

	// 회원등급변경
	@GetMapping("/changeGrade")
	public String changeGrade(HttpServletRequest request, Model model, @RequestParam("member_id")String member_id, @RequestParam("grade")String grade) throws Exception{
		//로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO)session.getAttribute("login");
		//아이디 추출
		String loginId= loginVO.getMember_id();
		
		if (loginId.equals(member_id)) {
			return "redirect:view?member_id="+member_id;
		}
		if (grade.equals("general")) {
			grade = "일반회원";
		}else if(grade.equals("elite")) {
			grade = "우수회원";
		}else if(grade.equals("admin")) {
			grade = "관리자";
		}
		service.changeGrade(member_id, grade);
		return "redirect:view?member_id="+member_id;
	}
	
	// 회원상태변경
		@GetMapping("/changeStatus")
		public String changeStatus(HttpServletRequest request, Model model, @RequestParam("member_id")String member_id, @RequestParam("status")String status) throws Exception{
			//로그인 정보를 받기
			HttpSession session = request.getSession();
			LoginVO loginVO = (LoginVO)session.getAttribute("login");
			//아이디 추출
			String loginId= loginVO.getMember_id();
			
			if (loginId.equals(member_id)) {
				return "redirect:view?member_id="+member_id;
			}
			if (status.equals("active")) {
				status = "활동회원";
			}else if(status.equals("inactive")) {
				status = "휴면회원";
			}
			service.changeStatus(member_id, status);
			return "redirect:view?member_id="+member_id;
		}
	
	//회원 강퇴
	@GetMapping("/delete")
	public String delete(HttpServletRequest request, AdminVO vo)throws Exception{
		service.delete(vo);
		return "redirect:list";
	}

}
