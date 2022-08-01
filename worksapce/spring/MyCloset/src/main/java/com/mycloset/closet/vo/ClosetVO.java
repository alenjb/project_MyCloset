package com.mycloset.closet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ClosetVO {

// 옷 아이디
	private String clothes_id;
//	이름
	private String clothes_name;
//	설명
	private String clothes_info;
//	사이즈
	private int clothes_size;
//	사진
	private String clothes_photo;
//	구입년도
	private Date clothes_purchase_year;
//	구입가격
	private int clothes_purchase_price;
//	계절
	private String clothes_season;
}
