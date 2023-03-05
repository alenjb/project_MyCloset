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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycloset.fitting.service.FittingService;
import com.mycloset.fitting.vo.FittingVO;
import com.mycloset.member.service.MemberService;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.member.vo.MemberVO;
import com.mycloset.util.Critera;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	// MemberService 주입
	@Inject
	private MemberService service;
	// fittingService 주입
	@Inject
	private FittingService fittingService;
	
//1. 홈
	@GetMapping("/home")
	public String home(Model model, HttpServletRequest request) throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		// 아이디 추출
		String memberId = loginVO.getMember_id();
		//임의로 cri 생성 하고 amount를 10, pageNum을 1로 설정
		Critera cri = new Critera();
		cri.setAmount(10);
		cri.setPageNum(1);
		//모든 public 피팅 불러오기
		List<FittingVO> fittings = fittingService.getRangeAllListWithPaging(cri, "public");
		for (FittingVO vo: fittings){
			//이미지 주소 형식 변환
			String image = vo.getFitting_image().replace("\\\\\\", "\\");
			vo.setFitting_image(image);
		} 
		//모든 피팅 불러오기
		List<FittingVO> myFitting = fittingService.list(memberId);
		for (FittingVO vo: myFitting){
			String image = vo.getFitting_image().replace("\\\\\\", "\\");
			vo.setFitting_image(image);
		} 
		//모델에 모든 public 피팅 추가
		model.addAttribute("fittings", fittings);
		//모델에 모든 피팅 추가
		model.addAttribute("myFitting",myFitting);
		return "member/home";
	}

	
// 2. 회원가입(signUp)
	
	// 2-1. 회원가입 폼
	@GetMapping("/signUp")
	public String signUpForm() throws Exception {
		return "member/signUp";
	}

	// 2-2. 회원가입
	@PostMapping("/signUp")
	public String signUp(MemberVO vo) throws Exception {
		service.signUp(vo);
		return "member/login";
	}

	// 2-3. 회원가입 시 아이디 중복체크(AJAX 사용)
	@GetMapping("/idCheck")
	@ResponseBody
	public Map<String, String> idCheck(String id) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		//결과에 id 중복체크한 내용 담기
		map.put("result",service.idCheck(id));
		return map;
	}
	
	// 2-3. 회원가입 시 이메일 중복체크(AJAX 사용)
	@GetMapping("/emailCheck")
	@ResponseBody
	public Map<String, String> emailCheck(String email) throws Exception {
		System.out.println(email);
		
		HashMap<String, String> map = new HashMap<String, String>();
		//결과에 이메일 중복체크한 내용 담기
		map.put("result",service.emailCheck(email));
		System.out.println("map: "+map);
		return map;
	}
	
// 3. 로그인 및 로그아웃 (login and logout)
	
	// 3-1. 로그인 폼
	@GetMapping("/login")
	public String loginForm() throws Exception {
		return "member/login";
	}

	// 3-2. 로그인
	@PostMapping("/login")
	public String login(LoginVO vo, HttpSession session, HttpServletResponse response, Model model, boolean rememberId) throws Exception {
		//로그인 실행
		LoginVO loginVO = service.login(vo);
		//로그인이 성공했으면
		if (loginVO != null) {
			//세션에 로그인VO 담기
			session.setAttribute("login", loginVO);
			//모델에 로그인VO 담기
			model.addAttribute("vo", loginVO);
			//아이디 기억하기
			//아이디 기억하기 체크했으면	
			if(rememberId(rememberId)) {
				//쿠키 생성
				Cookie cookie = new Cookie("id", loginVO.getMember_id());
				//쿠키 추가
				response.addCookie(cookie);
			}
			else {	//아이디 기억하기 체크안했으면	
				//쿠키 생성
				Cookie cookie = new Cookie("id", loginVO.getMember_id());
				//쿠키 MaxAge 0으로 설정
				cookie.setMaxAge(0);
				//쿠키 추가
				response.addCookie(cookie);
			}
			return "redirect:/member/home";
		}else {//로그인 실패했으면
			//로그인 창으로 다시 돌아가기
			return "redirect:/member/login";
		}
	}
	
	//	3-3. 아이디 기억하기
	private boolean rememberId(boolean rememberId) {
		return rememberId;
	}

	// 3-4. 로그아웃
	@GetMapping("/logut")
	public String logut(LoginVO vo, HttpSession session) throws Exception {
		//모든 세션 제거
		session.invalidate();
		return "member/login";
	}
	
	// 회원정보보기 / 내정보보기

	// 회원등급변경
	
//4. 아이디 및 비밀번호 찾기
	
	// 4-1. 아이디 찾기 폼
	@GetMapping("/findId")
	public String findIdForm() throws Exception {
		return "member/findId";
	}

	// 4-2. 아이디 찾기(AJAX 사용)
	@PostMapping("/findId")
	@ResponseBody
	public Map<String, Object> findId(String name, String email) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<>();
		//아이디 찾기 실행
		String id = service.findId(name, email);
		//아이디를 찾았으면
		if (service.findId(name, email) != null) {
			//결과에 아이디 넣기
			jsonData.put("id", id);
		}
		return jsonData;
	}

	// 4-3. 비밀번호 찾기 폼
	@GetMapping("/findPw")
	public String findPwForm() throws Exception {
		return "member/findPw";
	}

	// 4-4. 비밀번호 찾기(AJAX 사용)
	@PostMapping("/findPw")
	@ResponseBody
	public Map<String, Object> findPw(String id, String name, String email) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		//비밀번호 찾기 실행
		String pw = service.findPw(id, name, email);
		//비밀번호를 찾았으면
		if (service.findPw(id, name, email) != null) {
			//결과에 비밀번호 넣기
			jsonData.put("pw", pw);
		}
		return jsonData;
	}

	// 5. 마이 페이지(myPage)
	// 5-1. 마이페이지
	@GetMapping("/myPage")
	public String myPage(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		//로그인 되어있으면
		if (session.getAttribute("login") != null) {
			//아이디를 추출해서
			LoginVO vo = (LoginVO) session.getAttribute("login");
			//memberVO값을 가져와서 세션에 넣기 
			session.setAttribute("memberVO", service.myPage(vo));
		}
		return "member/myPage";
	}

	// 5-2. 마이 페이지 수정폼
	@GetMapping("/myPage/update")
	public String myPageUpdateForm(HttpServletRequest request, MemberVO vo, Model model) throws Exception {
		HttpSession session = request.getSession();
		//멤버정보를 세션에서 추출해서 모델에 담기
		model.addAttribute("memberVO", session.getAttribute("memberVO"));
		return "member/update";
	}
	
	// 5-3. 마이 페이지 수정
	@PostMapping("/myPage/update")
	public String myPageUpdate(MemberVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		//프로필 파일 생성
		MultipartFile file = vo.getMember_faceFile();
		//프로필 사진을 바꿨으면
		if(!vo.getMember_faceFile().getOriginalFilename().equals("")) {
			String uploadFolder = "/home/ubuntu/MyClosetDB/member";
			File saveFile = new File(uploadFolder, file.getOriginalFilename());
			try {//사진 저장
				file.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			//VO에 바뀐 프로필 사진 적용
			vo.setMember_face("/home/ubuntu/MyClosetDB/member/" + file.getOriginalFilename());			
		}
		//수정하기
		service.update(vo);
		//멤버 업데이트를 했기 때문에 로그인세션을 수정
		LoginVO LVO = (LoginVO)session.getAttribute("login");
		LVO.setMember_id(vo.getMember_id());
		LVO.setMember_name(vo.getMember_name());
		LVO.setMember_grade(vo.getMember_grade());
		if(vo.getMember_face() != null) {
			LVO.setMember_face(vo.getMember_face());			
		}		
		return "redirect:/member/myPage";
	}
	
	//5-4. 마이페이지 회원 탈퇴
	@GetMapping("/myPage/delete")
	public String myPageDelete(HttpServletRequest request) throws Exception {
		//세션에서 멤버정보 추출
		MemberVO vo = (MemberVO) request.getSession().getAttribute("memberVO");
		//탈퇴하기
		service.delete(vo);
		//세션에서 로그인 정보 제거
		request.getSession().removeAttribute("login");
		return "redirect:/member/login";
	}
}