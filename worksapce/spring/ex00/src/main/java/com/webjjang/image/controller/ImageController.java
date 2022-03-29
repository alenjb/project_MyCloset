package com.webjjang.image.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.webjjang.image.vo.ImageVO;
import com.webjjang.util.PageObject;

@Controller
@RequestMapping("/image")
public class ImageController {
	
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception{
		return "image/list";
	}
	@PostMapping("/changeImage.do")
	public String changeImage(PageObject pageObject, MultipartFile imageFile) throws Exception{
		return "redirect:view.do";
	}
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception{
		return "image/view";
	}
	@GetMapping("/write.do")
	public String write() throws Exception{
		return "image/write";
	}
	@PostMapping("/write.do")
	public String write(PageObject pageObject, ImageVO imageVO ) throws Exception{
		return "redirect:list.do";
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
