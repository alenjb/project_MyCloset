package com.webjjang.image.mapper;

import java.util.List;

import com.webjjang.image.vo.ImageVO;
import com.webjjang.util.PageObject;

public interface ImageMapper {
	//1. list
	public List<ImageVO> list (PageObject pageObject) throws Exception;
	
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	//2. view
	public ImageVO view(long no) throws Exception;
	//3. write
	public int write(ImageVO vo) throws Exception;
}