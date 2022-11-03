package com.mycloset.fitting.vo;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class ImageVO {

	//	피팅 사진 주소
	private String clothes_photo;
	//	피팅 사진 파일
	private MultipartFile fitting_photo_file;
}
