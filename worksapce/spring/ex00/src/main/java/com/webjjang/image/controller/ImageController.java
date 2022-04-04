package com.webjjang.image.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


import com.webjjang.image.service.ImageService;
import com.webjjang.image.vo.ImageVO;
import com.webjjang.member.vo.LoginVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/image")
@Log4j
public class ImageController {
	//자동 DI
	@Autowired
	private ImageService service;
	
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception{
		
		//페이지가 음수 값이면 1로 세팅한다.
		if(pageObject.getPage() < 1) pageObject.setPage(1);
		
		log.info("list()");
		
		model.addAttribute("list", service.list(pageObject));
		return "image/list";
	}
	@PostMapping("/changeImage.do")
	public String changeImage(PageObject pageObject, MultipartFile imageFile) throws Exception{
		return "redirect:view.do";
	}
	//이미지 보기
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception{
		//DB에서 데이터를 가져와서 model에 담는다. jsp에서 request에서 꺼낼 수 있다.
		model.addAttribute("vo", service.view(no));
		//가져온 데이터를 JSP에 표시하기 위해 JSP 정보를 리턴한다.
		return "image/view";
	}
	@GetMapping("/write.do")
	public String write() throws Exception{
		return "image/write";
	}
	@PostMapping("/write.do")
	public String write(PageObject pageObject, ImageVO imageVO, HttpSession session, HttpServletRequest request) throws Exception{
		log.info(pageObject);
		
		//작성자 아이디 세팅
		imageVO.setId(((LoginVO)session.getAttribute("login")).getId());

		//파일명을 세팅한다.
		 String path="/upload/image";
		 String fileName= FileUtil.upload(path, imageVO.getImage(), request);
		 imageVO.setFileName(fileName);
				
		log.info(imageVO);
		
		//db 정보 저장
		service.write(imageVO);
		return "redirect:list.do?page=1&perPageNum="+pageObject.getPerPageNum();
	}
	@GetMapping("/update.do")
	public String updateForm(PageObject pageObject, long no, Model model) throws Exception{
		return "image/update";
	}
	@PostMapping("/update.do")
	public String update(PageObject pageObject, ImageVO vo) throws Exception{
		return "redirect:view.do";
	}
	@GetMapping("/delete.do")
	public String delete(PageObject pageObject, long no, String deleteFile) throws Exception{
		return "redirect:list.do";
	}

}
