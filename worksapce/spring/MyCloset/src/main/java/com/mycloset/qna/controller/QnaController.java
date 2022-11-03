package com.mycloset.qna.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycloset.member.vo.LoginVO;
import com.mycloset.qna.service.QnaService;
import com.mycloset.qna.vo.QnaVO;
import com.mycloset.util.Critera;
import com.mycloset.util.PageDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna")
@Log4j
public class QnaController {

	@Autowired
	private QnaService service;

//	1.리스트(list)
	@GetMapping("/list")
	public String list(@ModelAttribute Critera cri, Model model) throws Exception {
		// 공지 리스트 가져오는 작업을 통해 리스트 형태로 저장
		List<QnaVO> lists = service.getListWithPaging(cri);
		//모델에 공지 리스트 담기
		model.addAttribute("list", lists);
		//옷 총 개수 세기
		int totalNum= service.getTotalNum(cri);
		//페이지 관련 정보 담기
		model.addAttribute("pageMaker", new PageDTO(cri, totalNum));
		return "qna/list";
	}

//	2.글보기(view)
	@GetMapping("/view")
	public String view(long no, Critera cri, Model model) throws Exception {
		//글 가져오기
		QnaVO vo = service.view(no);
		// 질문 줄바꿈 처리
		vo.setQContent(vo.getQContent().replace("\n", "<br>"));
		//답변이 등록 되어있으면
		if(vo.getAContent() !=null) {
			//답변 줄바꿈 처리
			vo.setAContent(vo.getAContent().replace("\n", "<br>"));			
		}
		//모델에 VO 담기
		model.addAttribute("vo", vo);
		//모델에 cri 담기
		model.addAttribute("cri",cri);
		return "qna/view";
	}
	
// 3.글쓰기(write)
	
	// 3-1 질문등록 폼
	@GetMapping("/write")
	public String writeForm() throws Exception {
		return "qna/write";
	}

	// 3-2 질문 등록
	@PostMapping("/write")
	public String write(QnaVO vo, Critera cri, HttpServletRequest request) throws Exception {
		//사진 파일 저장
		MultipartFile file = vo.getQPhotoFile();
		String uploadFolder = "D:\\jeongbin\\worksapce\\spring\\MyCloset\\src\\main\\webapp\\upload\\qna";
		File saveFile = new File(uploadFolder, file.getOriginalFilename());
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		//VO에 사진 주소 저장
		vo.setQImage("\\upload\\qna\\" + file.getOriginalFilename());
		//질문 등록
		service.write(vo);
		return "redirect:list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}

	//3-3 답변 등록 폼(관리자 전용)
	@GetMapping("/writeAnswer")
	public String writeAnswerForm(Critera cri, HttpServletRequest request, Model model,  long no) throws Exception {
		// 세션을 받기: 로그인 정보
		HttpSession session = request.getSession();
		// 세션에서 로그인 정보를 빼서 LVO에 저장
		LoginVO LVO = (LoginVO) session.getAttribute("login");
		// 사용자 등급을 추춣
		String grade = LVO.getMember_grade();
		//관리자가 아니면 접근 불가
		if(!grade.equals("관리자")) {
			return "redirect:list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
		}
		//모델에 qna 번호 담기
		model.addAttribute("no", no);
		return "qna/writeAnswer";
	}

	//3-4 답변 등록(관리자 전용)
	@PostMapping("/writeAnswer")
	public String writeAnswer(QnaVO vo, Critera cri, HttpServletRequest request) throws Exception {
		//사진 파일 저장
		MultipartFile file = vo.getAPhotoFile();
		String uploadFolder = "D:\\jeongbin\\worksapce\\spring\\MyCloset\\src\\main\\webapp\\upload\\qna";
		File saveFile = new File(uploadFolder, file.getOriginalFilename());
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		//VO에 사진 주소 저장
		vo.setAImage("\\upload\\qna\\" + file.getOriginalFilename());
		//답변 등록
		service.writeAnswer(vo);
		return "redirect:list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}
		
	
	
// 4. 수정(update)

	// 4-1. 질문 수정 폼
	@GetMapping("/update")
	public String updateForm(long no, Model model, Critera cri) throws Exception {
		model.addAttribute("vo", service.view(no));
		return "qna/update";
	}

	// 4-2. 짏문 수정
	@PostMapping("/update")
	public String update(QnaVO vo, Critera cri, HttpServletRequest request) throws Exception {
		//사진이 바꼈으면
		if(!vo.getQPhotoFile().getOriginalFilename().equals("")) {
			//파일 저장
			MultipartFile file = vo.getQPhotoFile();
			String uploadFolder = "D:\\jeongbin\\worksapce\\spring\\MyCloset\\src\\main\\webapp\\upload\\qna";
			File saveFile = new File(uploadFolder, file.getOriginalFilename());
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			//VO에 바뀐 사진 주소 저장
			vo.setQImage("\\upload\\qna\\" + file.getOriginalFilename());}
		//수정하기
		service.update(vo);
		return "redirect:list?type="+cri.getType()+"&keyword="+cri.getKeyword()+"&pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
		}
	
	// 4-3 답변 수정 폼
		@GetMapping("/updateAnswer")
		public String updateAnswerForm(long no, Model model, Critera cri) throws Exception {
			model.addAttribute("vo", service.view(no));
			return "qna/updateAnswer";
		}

	// 4-4 답변 수정
	@PostMapping("/updateAnswer")
	public String updateAnswer(QnaVO vo, Critera cri, HttpServletRequest request) throws Exception {
		//사진이 바꼈으면
		if(!vo.getAPhotoFile().getOriginalFilename().equals("")) {
			//파일 저장
			MultipartFile file = vo.getAPhotoFile();
			String uploadFolder = "D:\\jeongbin\\worksapce\\spring\\MyCloset\\src\\main\\webapp\\upload\\qna";
			File saveFile = new File(uploadFolder, file.getOriginalFilename());
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			//VO에 바뀐 사진 주소 저장
			vo.setAImage("\\upload\\qna\\" + file.getOriginalFilename());}
		//답변 수정하기
		service.updateAnswer(vo);
		return "redirect:list?type="+cri.getType()+"&keyword="+cri.getKeyword()+"&pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
		}

// 5. 삭제(delete)
	@GetMapping("/delete")
	public String delete(long no, Critera cri) throws Exception {
		service.delete(no);
		return "redirect:list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}


}
