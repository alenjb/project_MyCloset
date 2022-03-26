package com.webjjang.myapp;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
public class UploadController {
	
	@GetMapping("/uploadForm")
	//url에 jsp 정보가 다 존재한다. 그럴 때 리턴 타입을 String 대신에 void 사용 가능
	public void uploadForm() throws Exception{
		log.info("upload Form()");
	}

	@PostMapping("/uploadFormAction")

	public void uploadFormAction(MultipartFile uploadFile, HttpServletRequest request, Model model) throws Exception {
	// 메인 메모리(ram)이나 임시 폴더에 저장된 상태 - 아직 저장은 하지 않았다.
	log.info(uploadFile);
	log.info(uploadFile.getOriginalFilename());
	
	// 저장위치 - 서버 기준의 상대 위치 -> 실제적으로 저장할 때는 절대위치가 필요하다/

	String path = "/upload";

	// request를 이용해서 절대 위히를 구한다. > request는 파라미터로 받는다.
	
	String savePath = request.getServletContext().getRealPath(path);
	log.info(savePath);
	
	//파일을 저정해보자. -원래 파일명을 저장한다. 파일명이 같으면 덮어쓰기가 된다.
	uploadFile.transferTo(new File(savePath, uploadFile.getOriginalFilename()));
	
	//DB에 저장될 파일 정보
	String fileName= path+"/"+uploadFile.getOriginalFilename();
	log.info("fileName");
	model.addAttribute("fileName", fileName);}
	
	
	// 파일 첨부를 여러개 해서 받아보자.
	@GetMapping("/uploadForms")
	//url에 jsp 정보가 다 존재한다. 그럴 때 리턴 타입을 String 대신에 void 사용 가능
	public void uploadForms() throws Exception{
		log.info("uploadForms()");
	}
	
	@PostMapping("/uploadFormActions")
	public void uploadFormActions(List<MultipartFile> uploadFiles, HttpServletRequest request, Model model) throws Exception {
		// 메인 메모리(ram)이나 임시 폴더에 저장된 상태 - 아직 저장은 하지 않았다.
		log.info(uploadFiles);
		
		//들어오는 모든 파일 이름 출력해보기
		for(MultipartFile uploadFile: uploadFiles) {
			log.info(uploadFile.getOriginalFilename());
		}
	}



}
