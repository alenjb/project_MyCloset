package com.webjjang.image.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webjjang.image.mapper.ImageMapper;
import com.webjjang.image.vo.ImageVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ImageService {
	@Inject
	private ImageMapper mapper;
	
	public List<ImageVO> list (PageObject pageObject) throws Exception{
		log.info(pageObject);
		//페이지 처리 정보를 계산한다. - 안하면 데이터가 안나옴
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
		
	}
}
