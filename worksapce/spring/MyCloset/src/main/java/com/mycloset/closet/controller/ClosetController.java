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

import com.mycloset.closet.service.ClosetService;
import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.member.vo.MemberVO;
import com.mycloset.util.Critera;
import com.mycloset.util.PageDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/closet")
@Log4j
public class ClosetController {

	// ClosetService 주입
	@Inject
	private ClosetService service;

	// 옷등록 페이지 폼
	@GetMapping("/enroll")
	public String enrollForm() throws Exception {
		return "closet/enroll";
	}

	// 옷등록
	@PostMapping("/enroll")
	public String enroll(HttpServletRequest request, ClosetVO vo, Model model) throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		// 아이디 추출
		String memberId = loginVO.getMember_id();
		// 모델에 옷 리스트 담기
		model.addAttribute("member_id", memberId);
		
		MultipartFile file = vo.getClothes_photo_file();
		String uploadFolder = "D:\\jeongbin\\worksapce\\spring\\MyCloset\\src\\main\\webapp\\upload\\closet";
		File saveFile = new File(uploadFolder, file.getOriginalFilename());
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		vo.setClothes_photo("\\upload\\closet\\" + file.getOriginalFilename());
		vo.setMember_id(memberId);
		// 옷 등록 작업
		service.enroll(vo);
		return "redirect:list";
	}

	// 옷 리스트
	@GetMapping("/list")
	public void list(HttpServletRequest request, Critera cri, Model model) throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		// 아이디 추출
		String memberId = loginVO.getMember_id();
		// 옷 리스트 가져오는 작업을 통해 closets에 리스트 형태로 저장(일단 임시로 0을 보냄)
		// 0 자리는 아무 값이나 보내면 되서 0을 보냄
		List<ClosetVO> closets = service.getListWithPaging(cri, 0);
//		closets.forEach(b -> log.info(b));
//		log.info(closets);
		// 모델에 옷 리스트 담기
		model.addAttribute("closets", closets);
		// 옷 총 개수 세기
		int totalNum = service.getTotalNum();
		// 페이지 관련 정보 담기
		model.addAttribute("pageMaker", new PageDTO(cri, totalNum));
	}

	// 옷 상세 보기
	@GetMapping("/view")
	public String view(HttpServletRequest request, Model model, @RequestParam("clothes_id")String clothes_id) throws Exception{
		//로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO)session.getAttribute("login");
		//아이디 추출
		String memberId= loginVO.getMember_id();
		//모델에 옷 아이디 추가
		model.addAttribute("clothes_id", clothes_id);
		int cId = Integer.parseInt(clothes_id);
		//서비스에서 view 메서드 호출
		ClosetVO vo= service.view(memberId, cId);
		model.addAttribute("vo", vo);
		return "closet/view";
	}

	// 옷 수정폼
	@GetMapping("/update")
	public String UpdateForm(HttpServletRequest request, Model model, @RequestParam("clothes_id")String clothes_id) throws Exception {
		// 세션을 받기: 로그인 정보
		HttpSession session = request.getSession();
		// 세션에서 로그인 정보를 빼서 LVO에 저장
		LoginVO LVO = (LoginVO) session.getAttribute("login");
		// 사용자 아이디를 추춣
		String id = LVO.getMember_id();
		//url에서 옷 아이디를 가져와서 정수형으로 변환
		int cId = Integer.parseInt(clothes_id);
		//view로 내용 불러오기
		ClosetVO vo = service.view(id,cId);
		model.addAttribute("vo", vo);
		return "closet/update";
	}
	
	// 옷 수정 페이지
	@PostMapping("/update")
	public String Update(ClosetVO closetVO) throws Exception {
		MultipartFile file = closetVO.getClothes_photo_file();
		if(file != null) {
			String uploadFolder = "D:\\jeongbin\\worksapce\\spring\\MyCloset\\src\\main\\webapp\\upload\\closet";
			File saveFile = new File(uploadFolder, file.getOriginalFilename());
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			closetVO.setClothes_photo("\\upload\\closet\\" + file.getOriginalFilename());			
		}
		else {
			
		}
		System.out.println("이게 넘어곰 " + closetVO);
		service.update(closetVO);
		return "redirect:list";
	}

}
