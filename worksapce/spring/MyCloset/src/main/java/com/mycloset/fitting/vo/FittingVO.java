package com.mycloset.fitting.vo;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class FittingVO {

	// 	피팅 아이디
		private String fitting_id;
	// 	아우터 옷 아이디
		private String outer_clothes_id;
	// 	아우터 옷 아이디
		private String top_clothes_id;
	// 	아우터 옷 아이디
		private String bottom_clothes_id;
	//	피팅 이름
		private String fitting_name;
	//	피팅 사진 주소
		private String fitting_image;
	//	피팅 사진 파일
		private MultipartFile fitting_photo_file;
	//	피팅 설명
		private String fitting_info;
	// 	피팅 공개범위
		private String fitting_open_range;
	//	피팅 계절
		private String fitting_season;
	//	피팅 가격
		private int fitting_price;
	//	사용자 아이디
		private String member_id;
		
	//enroll 시 사용하기 위함
		// 아우터 옷 이미지
		private String outer_clothes_photo;
		// 상의 옷 이미지		
		private String top_clothes_photo;
		// 하의 옷 이미지
		private String bottom_clothes_photo;
		
		
	

}
