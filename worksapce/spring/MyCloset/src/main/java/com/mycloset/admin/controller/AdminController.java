package com.mycloset.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	// 1. 회원목록 리스트(관리자만 볼 수 있음)
	@GetMapping("/list")
	public String list(HttpServletRequest request, Critera cri, Model model) throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		//관리자일 경우에만 접근 가능
		//등급 추출
		String memberGrade = loginVO.getMember_grade();
		//관리자인지 확인
		if(memberGrade.equals("관리자")) {//관리자이면
			// 전체 개수 세기
			int totalNum = service.getTotalNum(cri);
			// 페이지 관련 정보 담기
			model.addAttribute("pageMaker", new PageDTO(cri, totalNum));
			// 리스트 가져오기
			List<AdminVO> lists = service.getListWithPaging(cri);
			//리스트 모델에 추가
			model.addAttribute("lists", lists);
			//회원목록 리스트로 이동
			return "admin/list";			
		}
		else {//관리자가 아니면
			//홈으로 돌려보내기
			return "member/home";
		}

	}
	// 2. 회원정보보기(관리자 입장에서) / 내정보보기(회원 입장에서)
	@GetMapping("/view")
	public String view(HttpServletRequest request, Critera cri, Model model, @RequestParam("member_id")String member_id) throws Exception{
		//모델에 조회할 회원 아이디 추가
		model.addAttribute("member_id", member_id);
		//모델에 페이지 정보 추가
		model.addAttribute("cri",cri);
		//서비스에서 view 메서드 호출
		AdminVO vo= service.view(member_id);
		//모델에 VO 추가
		model.addAttribute("vo", vo);
		//정보보기 페이지로 이동
		return "admin/view";
	}

	// 3. 회원등급변경
	@GetMapping("/changeGrade")
	public String changeGrade(HttpServletRequest request, Model model, @RequestParam("member_id")String member_id, @RequestParam("grade")String grade) throws Exception{
		//로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO)session.getAttribute("login");
		//아이디 추출
		String loginId= loginVO.getMember_id();
		//등급 분기
		if (loginId.equals(member_id)) {//자신의 계정이면
			//보기 페이지로 이동
			return "redirect:view?member_id="+member_id;
		}
		if (grade.equals("general")) {//일반회원으로 변경
			grade = "일반회원";
		}else if(grade.equals("elite")) {//우수회원으로 변경
			grade = "우수회원";
		}else if(grade.equals("admin")) {//관리자로 변경
			grade = "관리자";
		}
		//등급변경 실행하기
		service.changeGrade(member_id, grade);
		//정보보기 페이지로 다시 이동
		return "redirect:view?member_id="+member_id;
	}
	
	// 4. 회원상태변경
	@GetMapping("/changeStatus")
	public String changeStatus(HttpServletRequest request, Model model, @RequestParam("member_id")String member_id, @RequestParam("status")String status) throws Exception{
		//로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO)session.getAttribute("login");
		//아이디 추출
		String loginId= loginVO.getMember_id();
		
		if (loginId.equals(member_id)) {//자신의 계정이면
			//보기 페이지로 이동
			return "redirect:view?member_id="+member_id;
		}
		if (status.equals("active")) { //활동회원으로 변경
			status = "활동회원";
		}else if(status.equals("inactive")) {//휴면회원으로 변경
			status = "휴면회원";
		}
		//상태변경 실행하기
		service.changeStatus(member_id, status);
		//정보보기 페이지로 다시 이동
		return "redirect:view?member_id="+member_id;
	}
	
	// 5. 회원 강퇴
	@GetMapping("/delete")
	public String delete(HttpServletRequest request, AdminVO vo)throws Exception{
		//탈퇴 실행하기
		service.delete(vo);
		//리스트로 돌아가기
		return "redirect:list";
	}

}
