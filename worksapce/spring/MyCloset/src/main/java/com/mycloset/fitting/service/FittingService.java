package com.mycloset.fitting.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.mycloset.fitting.mapper.FittingMapper;
import com.mycloset.fitting.vo.FittingVO;
import com.mycloset.fitting.vo.ImageVO;
import com.mycloset.util.Critera;

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
	
	
//	3. 자신의 피팅 보여주기(view)
	public FittingVO view(String id, int num) throws Exception{
		return mapper.view(id, num);
	}
	
//페이징을 적용해 리스트 가져오기
	public List<FittingVO> getListWithPaging(@Param("cri")Critera cri, @Param("limitMax")int limitMax) throws Exception{
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		limitMax= pageNum * amount; 
		return mapper.getListWithPaging(cri, limitMax);
	}
	//총 피팅 개수 세기
	public int getTotalNum() throws Exception {
		return mapper.getTotalNum();
	}
}
