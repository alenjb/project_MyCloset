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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycloset.qna.vo.QnaVO;
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

	// 1.리스트(list)
	@GetMapping("/list")
	public String list(@ModelAttribute Critera cri, Model model) throws Exception {

		System.out.println("QnaController.list()");
		// 공지 리스트 가져오는 작업을 통해 qnas에 리스트 형태로 저장(일단 임시로 0을 보냄)
		// 0 자리는 아무 값이나 보내면 되서 0을 보냄
		List<QnaVO> lists = service.getListWithPaging(cri, 0);
		//모델에 공지 리스트 담기
		model.addAttribute("list", lists);
		//옷 총 개수 세기
		int totalNum= service.getTotalNum(cri);
		//페이지 관련 정보 담기
		model.addAttribute("pageMaker", new PageDTO(cri, totalNum));
		
		/* System.out.println(model); */
		return "qna/list";
	}

//	//2.글보기(view)

	@GetMapping("/view")
	public String view(long no, Critera cri, Model model) throws Exception {
		QnaVO vo = service.view(no);
		System.out.println(vo);
		// 줄바꿈 처리
		vo.setQContent(vo.getQContent().replace("\n", "<br>"));
		if(vo.getAContent() !=null) {
			vo.setAContent(vo.getAContent().replace("\n", "<br>"));			
		}

		model.addAttribute("vo", vo);
		model.addAttribute("cri",cri);
		return "qna/view";
	}
	// 3.글쓰기(write)
	// 3-1 writeForm
	@GetMapping("/write")
	public String writeForm() throws Exception {
		System.out.println("writeForm()");
		return "qna/write";
	}

	// 3-2 write
	@PostMapping("/write")
	public String write(QnaVO vo, Critera cri, HttpServletRequest request) throws Exception {
		System.out.println("QnaController.write().vo - " + vo);
		//파일 저장
		MultipartFile file = vo.getQPhotoFile();
		String uploadFolder = "D:\\jeongbin\\worksapce\\spring\\MyCloset\\src\\main\\webapp\\upload\\qna";
		File saveFile = new File(uploadFolder, file.getOriginalFilename());
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		vo.setQImage("\\upload\\qna\\" + file.getOriginalFilename());
		service.write(vo);
		return "redirect:list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}

	//관리자 전용
	//3-3 답변 폼
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
		model.addAttribute("no", no);
		return "qna/writeAnswer";
	}
	//3-3 답변
	@PostMapping("/writeAnswer")
	public String writeAnswer(QnaVO vo, Critera cri, HttpServletRequest request) throws Exception {
		System.out.println("QnaController.writeAnswer().vo - " + vo);
		//파일 저장
		MultipartFile file = vo.getAPhotoFile();
		String uploadFolder = "D:\\jeongbin\\worksapce\\spring\\MyCloset\\src\\main\\webapp\\upload\\qna";
		File saveFile = new File(uploadFolder, file.getOriginalFilename());
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		vo.setAImage("\\upload\\qna\\" + file.getOriginalFilename());
		service.writeAnswer(vo);
		return "redirect:list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}
	
	// 4. 수정(update)

	// 4-1 updateForm
	@GetMapping("/update")
	public String updateForm(@RequestParam("no")long no, Model model, Critera cri) throws Exception {
		System.out.println("updateForm().no-" + no);
		model.addAttribute("vo", service.view(no));
		System.out.println("여기까지 실행: "+service.view(no));
		return "qna/update";
	}

	// 4-2 update
	@PostMapping("/update")
	public String update(QnaVO vo, Critera cri, HttpServletRequest request) throws Exception {
		System.out.println("QnaController.update().vo - " + vo);
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
			vo.setQImage("\\upload\\qna\\" + file.getOriginalFilename());}
		service.update(vo);
		return "redirect:list?type="+cri.getType()+"&keyword="+cri.getKeyword()+"&pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
		}
	
	// 4-1 updateAnswerForm
		@GetMapping("/updateAnswer")
		public String updateAnswerForm(@RequestParam("no")long no, Model model, Critera cri) throws Exception {
			System.out.println("updateAnswerForm().no-" + no);
			model.addAttribute("vo", service.view(no));
			System.out.println("여기까지 실행: "+service.view(no));
			return "qna/updateAnswer";
		}

		// 4-2 updateAnswer
		@PostMapping("/updateAnswer")
		public String updateAnswer(QnaVO vo, Critera cri, HttpServletRequest request) throws Exception {
			System.out.println("QnaController.updateAnswer().vo - " + vo);
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
				vo.setAImage("\\upload\\qna\\" + file.getOriginalFilename());}
			service.updateAnswer(vo);
			return "redirect:list?type="+cri.getType()+"&keyword="+cri.getKeyword()+"&pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
			}

	// 5. 삭제(delete)
	@GetMapping("/delete")
	public String delete(long no, Critera cri) throws Exception {
		System.out.println("delete().no-" + no);
		service.delete(no);
		return "redirect:list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}


}
