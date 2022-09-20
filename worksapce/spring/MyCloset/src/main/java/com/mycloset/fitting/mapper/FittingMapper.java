package com.mycloset.fitting.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.fitting.vo.FittingVO;
import com.mycloset.fitting.vo.ImageVO;
import com.mycloset.util.Critera;
public interface FittingMapper {

//	1. 피팅 등록
	public int enroll(FittingVO vo) throws Exception;

//	1-1.피팅 등록폼에 내 옷장에 있는 사진 가져오기
	public List<ImageVO> getImages(@Param("member_id")String id) throws Exception;
	
//	3. 옷 보기
	public FittingVO view(@Param("member_id")String id, @Param("fitting_id")int num) throws Exception;
	
//	4. 옷 수정
	public int update(FittingVO vo) throws Exception;
	
	//페이지 처리와 함께 리스트를 가져오기
	public List<FittingVO> getListWithPaging(@Param("cri")Critera cri, @Param("limitMax")int limitMax);
	//총 피팅 개수 세기
	public int getTotalNum() throws Exception;
}
