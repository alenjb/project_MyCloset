package com.jb.board.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jb.board.service.BoardService;
import com.jb.board.vo.BoardVO;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;

	//리스트
	// 처리 결과를 request에 담아야 하는데 Spring에서는 Model에 존재한다.
	// model에 넣어주면 request에 담기도록 프로그래밍 되어있다. 파라미터로 모델 객체를 전달 받아서 사용한다.
	@GetMapping("/list.do")
	public String list(Model model) throws Exception{
		System.out.println("BoardController.list()");
		model.addAttribute("list", service.list());
		return "board/list";
	}
	
	//뷰
	@GetMapping("/view.do")
	public String view(long no, int inc, Model model) throws Exception {
		System.out.println("BoardController.view().no, inc - " + no + ", " + inc);

		// 글 내용 중에서 줄바꿈처리 해야만 한다. \n -> <br>로 바꾼다.
		BoardVO vo = service.view(no, inc);
		vo.setContent(vo.getContent().replace("\n", "<br>"));
		model.addAttribute("vo", vo);
		return "board/view";

	}
	
	//글쓰기
	// 3-1. writeForm
	@GetMapping("/write.do")
	public String writeFrom() throws Exception {
		return "board/write";

	}

	// 3-2.write
	@PostMapping("/write.do")
	public String write(BoardVO vo) throws Exception {
		System.out.println("BoardController.write().vo - " + vo);
		service.write(vo);

		// redirect 하는 페이지에서 한번만 사용되는 속성값을 적용할 수 있다. -> session
//		rttr.addFlashAttribute("msg", "성공적으로 글등록이 되셨습니다.");
		
		return "redirect:list.do";
	}
	
	// 4-1. updateForm
	@GetMapping("update.do")
	public String updateForm(long no, Model model) throws Exception {
		System.out.println("BoardController.updateForm().no - " + no);

		model.addAttribute("vo", service.view(no, 0));

		return "board/update";
	}
	
}
