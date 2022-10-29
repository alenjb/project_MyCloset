package com.mycloset.fitting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		// 폼에 보여줄 이미지들 가져오기
		System.out.println("아이디: " + memberId + "----------------------");
		List<ImageVO> list = service.getImages(memberId);
		// 모델에 리스트 담기
		model.addAttribute("list", list);
		model.addAttribute("member_id", memberId);
		System.out.println("리스트: " + list);
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
		String outer_clothes_photo = vo.getOuter_clothes_photo().replace("\\", "\\\\\\");
		String top_clothes_photo = vo.getTop_clothes_photo().replace("\\", "\\\\\\");
		String bottom_clothes_photo = vo.getBottom_clothes_photo().replace("\\", "\\\\\\");

		vo.setOuter_clothes_photo(outer_clothes_photo);
		vo.setTop_clothes_photo(top_clothes_photo);
		vo.setBottom_clothes_photo(bottom_clothes_photo);
		System.out.println("vo: " + vo);
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
		// 경로를 jsp에서 인식할 수 있게 백슬래시를 수정
		for (int i = 0; i < fittings.size(); i++) {
			String fitting_image = fittings.get(i).getFitting_image().replace("\\\\\\", "\\");
			fittings.get(i).setFitting_image(fitting_image);
		}

		// 모델에 피팅 리스트 담기
		model.addAttribute("fittings", fittings);
		// 옷 피팅 개수 세기
		int totalNum = service.getTotalNum(cri);
		// 페이지 관련 정보 담기
		model.addAttribute("pageMaker", new PageDTO(cri, totalNum));
	}
	
	@GetMapping("/listOpenRange")
	@ResponseBody
	public Object listOpenRange(@RequestParam Map<String, String> param, Critera cri) throws Exception{
		String openRange= param.get("fitting_open_range");
		
		if (openRange.equals("private")) {
			System.out.println("성공: "+cri);
			return service.getRangeListWithPaging(cri, 0, openRange);
		}
		return "";
	}
	// 3. 피팅 세부 보기
	@GetMapping("/view")
	public String view(HttpServletRequest request, Model model, Critera cri, @RequestParam("fitting_id") String fitting_id)
			throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		// 아이디 추출
		String memberId = loginVO.getMember_id();
		// 모델에 피팅 아이디 추가
		model.addAttribute("fitting_id", fitting_id);
		model.addAttribute("cri",cri);
		int fId = Integer.parseInt(fitting_id);
		// 서비스에서 view 메서드 호출
		FittingVO vo = service.view(memberId, fId);
		System.out.println("view 시 vo "+vo);
		// 사진 주소 형식들 바꿔주기
		String fittingImage = vo.getFitting_image().replace("\\\\\\", "\\");
		String outerImage = vo.getOuter_clothes_photo().replace("\\\\\\", "\\");
		String topImage = vo.getTop_clothes_photo().replace("\\\\\\", "\\");
		String bottomImage = vo.getBottom_clothes_photo().replace("\\\\\\", "\\");

		vo.setFitting_image(fittingImage);
		vo.setOuter_clothes_photo(outerImage);
		vo.setTop_clothes_photo(topImage);
		vo.setBottom_clothes_photo(bottomImage);

		model.addAttribute("vo", vo);
		return "fitting/view";
	}

	// 4. 피팅 수정
	// 4-1. 피팅 수정 폼
	@GetMapping("/update")
	public String UpdateForm(HttpServletRequest request, Model model, @RequestParam("fitting_id") String fitting_id)
			throws Exception {
		// 세션을 받기: 로그인 정보
		HttpSession session = request.getSession();
		// 세션에서 로그인 정보를 빼서 LVO에 저장
		LoginVO LVO = (LoginVO) session.getAttribute("login");
		// 사용자 아이디를 추춣
		String id = LVO.getMember_id();
		// url에서 옷 아이디를 가져와서 정수형으로 변환
		int fId = Integer.parseInt(fitting_id);
		// view로 내용 불러오기
		FittingVO vo = service.view(id, fId);

		List<ImageVO> list = service.getImages(id);
		// 모델에 리스트 담기
		model.addAttribute("list", list);
		model.addAttribute("member_id", id);
		model.addAttribute("vo", vo);
		log.info(vo);
		return "fitting/update";
	}

	// 4-2. 피팅 수정
	@PostMapping("/update")
	public String Update(HttpServletRequest request, FittingVO fittingVO) throws Exception {
		// 세션을 받기: 로그인 정보
		HttpSession session = request.getSession();
		// 세션에서 로그인 정보를 빼서 LVO에 저장
		LoginVO LVO = (LoginVO) session.getAttribute("login");
		// 사용자 아이디를 추춣
		String id = LVO.getMember_id();
		// 아우터 주소값 변환하기(\ 한개를 \ 3개로)
		//각 옷 아이디 가져오기
		HashMap<String, String> idList= service.getClothesIdAndPrice(id, fittingVO.getOuter_clothes_photo(), fittingVO.getTop_clothes_photo(), fittingVO.getBottom_clothes_photo());
		fittingVO.setOuter_clothes_id(String.valueOf(idList.get("outer_clothes_id")));
		fittingVO.setTop_clothes_id(String.valueOf(idList.get("top_clothes_id")));
		fittingVO.setBottom_clothes_id(String.valueOf(idList.get("bottom_clothes_id")));
		fittingVO.setFitting_price(Integer.parseInt(String.valueOf(idList.get("price"))));

		String outerSrc = fittingVO.getOuter_clothes_photo().replace("\\", "\\\\\\");
		fittingVO.setOuter_clothes_photo(outerSrc);
		// 상의 주소값 변환하기(\ 한개를 \ 3개로)
		String topSrc = fittingVO.getTop_clothes_photo().replace("\\", "\\\\\\");
		fittingVO.setTop_clothes_photo(topSrc);
		// 하의 주소값 변환하기(\ 한개를 \ 3개로)
		String bottomSrc = fittingVO.getBottom_clothes_photo().replace("\\", "\\\\\\");
		fittingVO.setBottom_clothes_photo(bottomSrc);
		System.out.println("피팅 업데이트 VO: "+fittingVO);
		service.update(fittingVO);
		return "redirect:list";
	}

	// 5. 피팅 삭제
	@GetMapping("/delete")
	public String delete(HttpServletRequest request, FittingVO vo)throws Exception{
		// 세션을 받기: 로그인 정보
		HttpSession session = request.getSession();
		// 세션에서 로그인 정보를 빼서 LVO에 저장
		LoginVO LVO = (LoginVO) session.getAttribute("login");
		// 사용자 아이디를 추춣
		String id = LVO.getMember_id();
		//vo에 member_id를 입력
		vo.setMember_id(id);
		System.out.println("삭제 VO: "+vo);
		service.delete(vo);
		return "redirect:list";
	}
}
