package com.mycloset.member.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycloset.fitting.service.FittingService;
import com.mycloset.fitting.vo.FittingVO;
import com.mycloset.member.service.MemberService;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.member.vo.MemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	// MemberService 주입
	@Inject
	private MemberService service;
	@Inject
	private FittingService fittingService;

	// 회원가입 폼
	@GetMapping("/signUp")
	public String signUpForm() throws Exception {
		return "member/signUp";
	}

	// 회원가입
	@PostMapping("/signUp")
	public String signUp(MemberVO vo) throws Exception {
		service.signUp(vo);
		return "member/login";
	}

	// 회원가입 시 아이디 중복체크
	@GetMapping("/idCheck")
	@ResponseBody
	public Map<String, String> idCheck(String id) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result",service.idCheck(id));
		return map;
	}

	// 로그인 폼
	@GetMapping("/login")
	public String loginForm() throws Exception {
		log.info("로그인 폼으로 이동");
		return "member/login";
	}

	// 로그인
	@PostMapping("/login")
	public String login(LoginVO vo, HttpSession session, HttpServletResponse response, Model model, boolean rememberId) throws Exception {
		LoginVO loginVO = service.login(vo);
		if (loginVO != null) {
			session.setAttribute("login", loginVO);
			log.info("로그인처리  vo: " + loginVO);
			model.addAttribute("vo", loginVO);
		//아이디 기억하기
			//아이디 기억하기 체크했으면	
			if(rememberId(rememberId)) {
				Cookie cookie = new Cookie("id", loginVO.getMember_id());
				response.addCookie(cookie);
			}
			//아이디 기억하기 체크안했으면	
			else {
				Cookie cookie = new Cookie("id", loginVO.getMember_id());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			return "redirect:/member/home";
		} else {
			log.info("로그인 할 수 없음");
			return "redirect:/member/login";
		}
	}
	//아이디 기억하기
	private boolean rememberId(boolean rememberId) {
		return rememberId;
	}

	// 로그아웃
	@GetMapping("/logut")
	public String logut(LoginVO vo, HttpSession session) throws Exception {
//		session.removeAttribute("login");
		session.invalidate();
		log.info("로그아웃처리  vo: " + service.login(vo));
		return "member/login";
	}

	// 회원 리스트
	// 관리자만 볼 수 있음
	@GetMapping("/list")
	public String list(@ModelAttribute PageObject object, Model model, HttpSession session) throws Exception {
		model.addAttribute("list", service.list(object));
		return "member/list";

	}
	// 회원정보보기 / 내정보보기

	// 회원등급변경

	// 아이디 찾기 폼
	@GetMapping("/findId")
	public String findIdForm() throws Exception {

		log.info("아이디 찾기 폼으로 이동");
		return "member/findId";
	}

	// 아이디 찾기
	@PostMapping("/findId")
	@ResponseBody
	public Map<String, Object> findId(String name, String email) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		String id = service.findId(name, email);
		if (service.findId(name, email) != null) {
			log.info("아이디 찾기 성공");
			jsonData.put("id", id);
		}
		log.info(id);
		log.info(jsonData);
		return jsonData;
	}

	// 비밀번호 찾기 폼
	@GetMapping("/findPw")
	public String findPwForm() throws Exception {
		log.info("비밀번호 찾기 폼으로 이동");
		return "member/findPw";
	}

	// 비밀번호 찾기
	@PostMapping("/findPw")
	@ResponseBody
	public Map<String, Object> findPw(String id, String name, String email) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		String pw = service.findPw(id, name, email);

		if (service.findPw(id, name, email) != null) {
			jsonData.put("pw", pw);
		}
		return jsonData;
	}

	// 홈
	@GetMapping("/home")
	public String home(Model model, HttpServletRequest request) throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		// 아이디 추출
		String memberId = loginVO.getMember_id();
		//모든 public 피팅 불러오기
		List<FittingVO> fittings = fittingService.getAllPublicFitting();
		for (FittingVO vo: fittings){
			String image = vo.getFitting_image().replace("\\\\\\", "\\");
			vo.setFitting_image(image);
		} 
		List<FittingVO> myFitting = fittingService.list(memberId);
		for (FittingVO vo: myFitting){
			String image = vo.getFitting_image().replace("\\\\\\", "\\");
			vo.setFitting_image(image);
		} 
		model.addAttribute("fittings", fittings);
		model.addAttribute("myFitting",myFitting);
		return "member/home";
	}

	// 마이 페이지
	@GetMapping("/myPage")
	public String myPage(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("login"));
		if (session.getAttribute("login") != null) {
			LoginVO vo = (LoginVO) session.getAttribute("login");
			session.setAttribute("memberVO", service.myPage(vo));
			System.out.println("vo" + vo);
		}
		return "member/myPage";
	}

	// 마이 페이지 수정
	@GetMapping("/myPage/update")
	public String myPageUpdateForm(HttpServletRequest request, MemberVO vo, Model model) throws Exception {
		HttpSession session = request.getSession();
		System.out.println("도착함");
		System.out.println("request임:  " + session.getAttribute("memberVO"));
		model.addAttribute("memberVO", session.getAttribute("memberVO"));
//			service.update(vo);
		return "member/update";
	}
	// 마이 페이지 수정

	@PostMapping("/myPage/update")
	public String myPageUpdate(MemberVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("login"));
		System.out.println("멤버VO: "+vo);
		MultipartFile file = vo.getMember_faceFile();
		log.info(vo.getMember_faceFile().getOriginalFilename());
		if(!vo.getMember_faceFile().getOriginalFilename().equals("")) {
			String uploadFolder = "D:\\jeongbin\\worksapce\\spring\\MyCloset\\src\\main\\webapp\\upload\\member";
			File saveFile = new File(uploadFolder, file.getOriginalFilename());
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			vo.setMember_face("\\upload\\member\\" + file.getOriginalFilename());			
		}
		else {
			
		}
		service.update(vo);
		//멤버 업데이트를 했기 때문에 로그인세션을 수정
//		LoginVO LVO = new LoginVO();
		LoginVO LVO = (LoginVO)session.getAttribute("login");
		LVO.setMember_id(vo.getMember_id());
		LVO.setMember_name(vo.getMember_name());
		LVO.setMember_grade(vo.getMember_grade());
		if(vo.getMember_face() != null) {
			LVO.setMember_face(vo.getMember_face());			
		}
//		session.removeAttribute("login");
//		session.setAttribute("login", service.login(LVO));
		System.out.println("LVO: "+LVO);
		
		return "redirect:/member/myPage";
	}

	@GetMapping("/myPage/delete")
	public String myPageDelete(HttpServletRequest request) throws Exception {
		MemberVO vo = (MemberVO) request.getSession().getAttribute("memberVO");
		service.delete(vo);
		request.getSession().removeAttribute("login");
		System.out.println("제거한 후 세션 " + request.getSession());

		return "redirect:/member/login";
	}

}
