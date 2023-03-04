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
import com.mycloset.util.FittingCriteria;
import com.mycloset.util.PageDTO;

@Controller
@RequestMapping("/fitting")

public class FittingController {
	@Inject
	FittingService service;

	// 1. 피팅 리스트(list)
	
	//1-1 list 보여주기
	@GetMapping("/list")
	public void list(HttpServletRequest request, FittingCriteria cri, Model model) throws Exception {
		/*
		 FitiingCriteria에는
		 pageNum(페이지 번호), amount(한 페이지 게시물 개수), type(검색 종류), keyword(검색어) 이외에
		 publicBtnCheck(public 버튼 활성화 여부), privateBtnCheck(private 버튼 활성화 여부) 가 추가됨
		 */
		
		// 옷 리스트 가져오는 작업을 통해 리스트 형태로 저장
		List<FittingVO> fittings = service.getListWithPaging(cri);

		// 경로를 jsp에서 인식할 수 있게 백슬래시를 수정
		for (int i = 0; i < fittings.size(); i++) {
			String fitting_image = fittings.get(i).getFitting_image().replace("\\\\\\", "\\");
			fittings.get(i).setFitting_image(fitting_image);
		}
		
		// 모델에 피팅 리스트 담기
		model.addAttribute("fittings", fittings);
		model.addAttribute("publicBtnCheck", cri.isPublicBtnCheck());
		model.addAttribute("privateBtnCheck", cri.isPrivateBtnCheck());

		// 옷 피팅 개수 세기
		int totalNum = service.getTotalNum(cri);
		// 페이지 관련 정보 담기
		model.addAttribute("pageMaker", new PageDTO(cri, totalNum));
	}
	
	//1-2 AJAX 리스트 openRange에 따른 결과 전송
	@GetMapping("/listOpenRange")
	@ResponseBody
	public Object listOpenRange(@RequestParam Map<String, String> param) throws Exception{
		//openRange 추출
		String openRange= param.get("fitting_open_range");
		//pageNum 추출
		int pageNum= Integer.parseInt(param.get("pageNum"));		
		//amount 추출
		int amount= Integer.parseInt(param.get("amount"));		
		//type 추출
		String type= param.get("type");		
		//keyword 추출
		String keyword= param.get("keyword");		
		//추출한 데이터를 바탕으로 Criteria 만들기
		Critera cri= new Critera();
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		cri.setType(type);
		cri.setKeyword(keyword);
		//openRange 적용해서 리스트 가져오기
		List<FittingVO> list = service.getRangeListWithPaging(cri, openRange);
		for(FittingVO vo: list) {
			//이미지 형식 변환
			String fittingIamge=vo.getFitting_image().replace("\\\\\\", "\\");
			//vo에 담기
			vo.setFitting_image(fittingIamge);
		}
		return list;
	}
	
	// 2. 피팅 등록(enroll)
	
	// 2-1. 피팅 등록 폼
	@GetMapping("/enroll")
	public String enrollForm(HttpServletRequest request, Model model) throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		// 아이디 추출
		String memberId = loginVO.getMember_id();
		// 폼에 보여줄 이미지들 가져오기
		List<ImageVO> list = service.getImages(memberId);
		// 모델에 리스트 담기
		model.addAttribute("list", list);
		model.addAttribute("member_id", memberId);
		return "fitting/enroll";
	}

	// 2-2. 피팅 등록
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
		service.enroll(vo);

		return "redirect:list";
	}
	
	// 3. 피팅 세부 보기
	@GetMapping("/view")
	public String view(HttpServletRequest request, Model model, FittingCriteria cri, @RequestParam("fitting_id") String fitting_id)
			throws Exception {
		// 로그인 정보를 받기
		HttpSession session = request.getSession();
		//로그인VO 추출
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		// 아이디 추출
		String memberId = loginVO.getMember_id();
		// 모델에 피팅 아이디 추가
		model.addAttribute("fitting_id", fitting_id);
		// 모델에 cri 추가
		model.addAttribute("cri",cri);
		int fId = Integer.parseInt(fitting_id);
		// 서비스에서 view 메서드 호출
		FittingVO vo = service.view(memberId, fId);
		// 사진 주소 형식들 바꿔주기
		String fittingImage = vo.getFitting_image().replace("\\\\\\", "\\");
		String outerImage = vo.getOuter_clothes_photo().replace("\\\\\\", "\\");
		String topImage = vo.getTop_clothes_photo().replace("\\\\\\", "\\");
		String bottomImage = vo.getBottom_clothes_photo().replace("\\\\\\", "\\");
		//vo에 바뀐 사진주소 적용하기
		vo.setFitting_image(fittingImage);
		vo.setOuter_clothes_photo(outerImage);
		vo.setTop_clothes_photo(topImage);
		vo.setBottom_clothes_photo(bottomImage);
		//모델에 vo 담기
		model.addAttribute("vo", vo);
		return "fitting/view";
	}

	// 4. 피팅 수정
	
	// 4-1. 피팅 수정 폼
	@GetMapping("/update")
	public String UpdateForm(HttpServletRequest request, Model model, @RequestParam("fitting_id") String fitting_id) throws Exception {
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
		// 내옷장에 있는 사진들 가져오기
		List<ImageVO> list = service.getImages(id);
		// 모델에 리스트 담기
		model.addAttribute("list", list);
		// 모델에 아이디 담기
		model.addAttribute("member_id", id);
		// 모델에 vo 담기
		model.addAttribute("vo", vo);
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
		//각 옷 아이디 가져오기
		HashMap<String, String> idList= service.getClothesIdAndPrice(id, fittingVO.getOuter_clothes_photo(), fittingVO.getTop_clothes_photo(), fittingVO.getBottom_clothes_photo());
		//가져온 옷 아디디들 vo에 적용하기
		fittingVO.setOuter_clothes_id(String.valueOf(idList.get("outer_clothes_id")));
		fittingVO.setTop_clothes_id(String.valueOf(idList.get("top_clothes_id")));
		fittingVO.setBottom_clothes_id(String.valueOf(idList.get("bottom_clothes_id")));
		fittingVO.setFitting_price(Integer.parseInt(String.valueOf(idList.get("price"))));
		// 아우터 주소값 변환하기(\ 한개를 \ 3개로)
		String outerSrc = fittingVO.getOuter_clothes_photo().replace("\\", "\\\\\\");
		fittingVO.setOuter_clothes_photo(outerSrc);
		// 상의 주소값 변환하기(\ 한개를 \ 3개로)
		String topSrc = fittingVO.getTop_clothes_photo().replace("\\", "\\\\\\");
		fittingVO.setTop_clothes_photo(topSrc);
		// 하의 주소값 변환하기(\ 한개를 \ 3개로)
		String bottomSrc = fittingVO.getBottom_clothes_photo().replace("\\", "\\\\\\");
		fittingVO.setBottom_clothes_photo(bottomSrc);
		// 수정하기
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
		//삭제하기
		service.delete(vo);
		return "redirect:list";
	}
}
