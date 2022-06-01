package com.mycloset.notice.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycloset.notice.service.NoticeService;
import com.mycloset.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	//1.리스트(list)
	@GetMapping("/list")
	public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception{
		System.out.println("NoticeController.list()");
		model.addAttribute("list", service.list(pageObject));
		return "notice/list";
	}
	
	//2.글보기(view)
	@GetMapping("/view")
	public String view(long no, Model model) throws Exception{
		System.out.println("NoticeController.view()");
		return "notice/view";
	}
	//3.글쓰기(write)
	
	//3-1 writeForm
	@GetMapping("/write")
	public String writeForm() throws Exception {
		System.out.println("writeForm()");
		return "notice/write";
	}
	
	//3-2 write
	@PostMapping("/write")
	public String write(NoticeVO vo, HttpServletResponse response) throws Exception {
		System.out.println("NoticeController.write().vo - " + vo);
		service.write(vo);
		return "redirect:list";
	}
	
	//4. 수정(update)
	
	//4-1 updateForm
	//4-2 update
	
	//5. 삭제(delete)
	
	
	
	
}
