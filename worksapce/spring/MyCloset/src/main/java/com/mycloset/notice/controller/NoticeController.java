package com.mycloset.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycloset.notice.service.NoticeService;
import com.mycloset.notice.vo.NoticeVO;
import com.mycloset.util.Critera;
import com.mycloset.util.PageDTO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService service;

// 1.리스트(list)
	//list
	@GetMapping("/list")
	public String list(@ModelAttribute Critera cri, Model model) throws Exception {

		// 공지 리스트 가져오는 작업을 통해 notices에 리스트 형태로 저장(일단 임시로 0을 보냄)
		// 0 자리는 아무 값이나 보내면 되서 0을 보냄
		List<NoticeVO> notices = service.getListWithPaging(cri);
		//모델에 공지 리스트 담기
		model.addAttribute("list", notices);
		//옷 총 개수 세기
		int totalNum= service.getTotalNum(cri);
		//페이지 관련 정보 담기
		model.addAttribute("pageMaker", new PageDTO(cri, totalNum));

		/* System.out.println(model); */
		return "notice/list";
	}

//2.글보기(view)
	//view
	@GetMapping("/view")
	public String view(long no, Critera cri, Model model) throws Exception {
		NoticeVO vo = service.view(no);
		// 줄바꿈 처리
		vo.setContent(vo.getContent().replace("\n", "<br>"));
		model.addAttribute("vo", vo);
		model.addAttribute("cri",cri);
		return "notice/view";
	}

// 3.글쓰기(write)

	// 3-1 writeForm
	@GetMapping("/write")
	public String writeForm() throws Exception {
		return "notice/write";
	}

	// 3-2 write
	@PostMapping("/write")
	public String write(NoticeVO vo, Critera cri, HttpServletRequest request) throws Exception {
		service.write(vo);
		return "redirect:list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}


// 4. 수정(update)

	// 4-1 updateForm2
	@GetMapping("/update")
	public String updateForm(@RequestParam("no")long no, Model model, Critera cri) throws Exception {
		model.addAttribute("vo", service.view(no));
		return "notice/update";
	}

	// 4-2 update
	@PostMapping("/update")
	public String update(NoticeVO vo, Critera cri, HttpServletRequest request) throws Exception {
		service.update(vo);
		return "redirect:list?type="+cri.getType()+"&keyword="+cri.getKeyword()+"&pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
		}


// 5. 삭제(delete)
	
	//delete
	@GetMapping("/delete")
	public String delete(long no, Critera cri) throws Exception {
		service.delete(no);
		return "redirect:list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}
}
