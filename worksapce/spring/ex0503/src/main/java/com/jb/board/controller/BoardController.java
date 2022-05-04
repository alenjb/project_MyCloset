package com.jb.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jb.board.service.BoardService;

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
	
	//글쓰기
	
	
}
