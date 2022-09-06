package com.mycloset.fitting.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.fitting.mapper.FittingMapper;
import com.mycloset.fitting.vo.FittingVO;
import com.mycloset.fitting.vo.ImageVO;

@Service
public class FittingService {
	@Inject
	FittingMapper mapper;

//	1. 피팅 등록
	public int enroll(FittingVO vo) throws Exception {
		return mapper.enroll(vo);
	}

//	1-1.피팅 등록폼에 내 옷장에 있는 사진 가져오기
	public List<ImageVO> getImages(String id) throws Exception {
		return mapper.getImages(id);
	}
}
