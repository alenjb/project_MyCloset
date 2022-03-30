package com.webjjang.image.mapper;

import java.util.List;

import com.webjjang.image.vo.ImageVO;
import com.webjjang.util.PageObject;

public interface ImageMapper {
	
	public List<ImageVO> list (PageObject pageObject) throws Exception;
	
	public long getTotalRow(PageObject pageObject) throws Exception;
}
