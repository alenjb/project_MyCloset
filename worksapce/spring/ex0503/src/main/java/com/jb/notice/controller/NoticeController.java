package com.jb.notice.controller;


import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jb.notice.service.NoticeService;
import com.jb.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;



@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	//리스트
	// 처리 결과를 request에 담아야 하는데 Spring에서는 Model에 존재한다.
	// model에 넣어주면 request에 담기도록 프로그래밍 되어있다. 파라미터로 모델 객체를 전달 받아서 사용한다.
	// period -  현재공지: pre,  지난공지 :old,    예약공지: res ,  전체공지: all
	@GetMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception{
		
		// 페이지가 1보다 작으면 1페이지로 세팅한다/.
		if (pageObject.getPage() < 1)
			pageObject.setPage(1);

		System.out.println("NoticeController.list()");
		model.addAttribute("list", service.list(pageObject));
		return "notice/list";
	}
	
	//뷰
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception {
		System.out.println("NoticeController.view().no, - " + no);

		// 글 내용 중에서 줄바꿈처리 해야만 한다. \n -> <br>로 바꾼다.
		NoticeVO vo = service.view(no);
		System.out.println(vo.getContent()+"vo.getContent()");

		//		vo.setContent(vo.getContent().replace("\n", "<br>"));
		vo.setContent(vo.getContent());
		model.addAttribute("vo", vo);
		return "notice/view";

	}
	
	//글쓰기
	// 3-1. writeForm
	@GetMapping("/write.do")
	public String writeFrom() throws Exception {
		return "notice/write";

	}

	// 3-2.write
	@PostMapping("/write.do")
	public String write(NoticeVO vo, int perPageNum, RedirectAttributes rttr, HttpServletResponse response) throws Exception {
		System.out.println("NoticeController.write().vo - " + vo);
		service.write(vo);

		// redirect 하는 페이지에서 한번만 사용되는 속성값을 적용할 수 있다. -> session
//		rttr.addFlashAttribute("msg", "성공적으로 글등록이 되셨습니다.");
		
		return "redirect:list.do?page=1&perPageNum=" + perPageNum;

	}
	
	// 4-1. updateForm
	@GetMapping("update.do")
	public String updateForm(long no, Model model) throws Exception {
		System.out.println("NoticeController.updateForm().no - " + no);

		model.addAttribute("vo", service.view(no));

		return "notice/update";
	}
	
	// 4-2. update
	@PostMapping("update.do")
	public String update(PageObject pageObject, NoticeVO vo, RedirectAttributes rttr) throws Exception {
		System.out.println("NoticeController.update().vo - " + vo);
		service.update(vo);
		rttr.addFlashAttribute("msg", "정보가 수정되었습니다.");
		return "redirect:view.do?no=" + vo.getNo() + "&page=" + pageObject.getPage() + "&perPageNum="
		+ pageObject.getPerPageNum()+"&key="+pageObject.getKey()
		//자바부분의 한글코드와 운영한글코드가 다르므로 자바에서 꺼내서 넣으면 한글이 깨짐 -> endcoding 필요
		+"&word="+ URLEncoder.encode(pageObject.getWord(), "utf-8");
	}
	
	// 5. delete
	@GetMapping("delete.do")
	public String delete(int no, int perPageNum, RedirectAttributes rttr) throws Exception {
		System.out.println("NoticeController.delete().no - " + no);
		service.delete(no);
		
		rttr.addFlashAttribute("msg", "성공적으로 글 삭제가 되었습니다.");
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
}
