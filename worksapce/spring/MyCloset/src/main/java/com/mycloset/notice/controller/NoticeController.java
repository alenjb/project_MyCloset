package com.mycloset.notice.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.notice.service.NoticeService;
import com.mycloset.notice.vo.NoticeVO;
import com.mycloset.util.Critera;
import com.mycloset.util.PageDTO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice")
@Log4j
public class NoticeController {

	@Autowired
	private NoticeService service;

	// 1.리스트(list)
	@GetMapping("/list")
	public String list(@ModelAttribute Critera cri, Model model) throws Exception {

		System.out.println("NoticeController.list()");
		// 공지 리스트 가져오는 작업을 통해 notices에 리스트 형태로 저장(일단 임시로 0을 보냄)
		// 0 자리는 아무 값이나 보내면 되서 0을 보냄
		List<NoticeVO> notices = service.getListWithPaging(cri, 0);
		//모델에 공지 리스트 담기
		model.addAttribute("list", notices);
		//옷 총 개수 세기
		int totalNum= service.getTotalNum(cri);
		//페이지 관련 정보 담기
		model.addAttribute("pageMaker", new PageDTO(cri, totalNum));

		System.out.println(model);
		return "notice/list";
	}

//	//2.글보기(view)
//	@GetMapping("/view")
//	public String view(long no, Model model) throws Exception{
//		System.out.println("NoticeController.view()");
//		NoticeVO vo = service.view(no);
//		System.out.println(vo.getContent()+"vo.getContent()");
//		//줄바꿈 처리
//		vo.setContent(vo.getContent().replace("\n", "<br>"));
//		model.addAttribute("vo", vo);
//		return "notice/view";
//	}

	@GetMapping("/view")
	public String view(long no, Critera cri, Model model) throws Exception {
		System.out.println("NoticeController.view()");
		NoticeVO vo = service.view(no);
		System.out.println(vo.getContent() + "vo.getContent()");
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
		System.out.println("writeForm()");
		return "notice/write";
	}

	// 3-2 write
	@PostMapping("/write")
	public String write(NoticeVO vo, PageObject pageObject, HttpServletResponse response) throws Exception {
		System.out.println("NoticeController.write().vo - " + vo);
		service.write(vo);
		return "redirect:list?page=1&perPageNum=" + pageObject.getPerPageNum();
	}

	// 4. 수정(update)

	// 4-1 updateForm2
	@GetMapping("/update")
	public String updateForm(long no, Model model) throws Exception {
		System.out.println("updateForm().no-" + no);
		model.addAttribute("vo", service.view(no));
		return "notice/update";
	}

	// 4-2 update
	@PostMapping("/update")
	public String update(NoticeVO vo, PageObject pageObject, HttpServletResponse response) throws Exception {
		System.out.println("NoticeController.update().vo - " + vo);
		service.update(vo);
		return "redirect:list?page=" + pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum() + "&key="
				+ pageObject.getKey() + "&word=" + URLEncoder.encode(pageObject.getKey(), "utf-8");
	}

	// 5. 삭제(delete)
	@GetMapping("/delete")
	public String delete(long no, PageObject pageObject) throws Exception {
		System.out.println("delete().no-" + no);
		service.delete(no);
		return "redirect:list?page=1&perPageNum=" + pageObject.getPerPageNum();
	}

//	//1.리스트(list)
//	@GetMapping("/list2")
//	public String list2(@ModelAttribute PageObject pageObject, Model model) throws Exception{
//		
//		//페이지가 1보다 작으면 1페이지로 설정
//		if(pageObject.getPage() < 1) {
//			pageObject.setPage(1);
//		}
//		
//		System.out.println("NoticeController.list()");
//		model.addAttribute("list", service.list(pageObject));
//		return "notice/list2";
//	}
}
