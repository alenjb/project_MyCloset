package com.mycloset.closet.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ClosetVO {

// 옷 아이디
	private String clothes_id;
// 상,하의 구분
	private String clothes_type;
//	이름
	private String clothes_name;
//	설명
	private String clothes_info;
//	사이즈
	private int clothes_size;
//	사진 주소
	private String clothes_photo;
//	사진 파일
	private MultipartFile clothes_photo_file;

	//	구입년도
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date clothes_purchase_year;
//	구입가격
	private int clothes_purchase_price;
//	계절
	private String clothes_season;
}
