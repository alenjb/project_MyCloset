package com.mycloset.fitting.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.mycloset.fitting.vo.FittingVO;
import com.mycloset.fitting.vo.ImageVO;
public interface FittingMapper {

//	1. 피팅 등록
	public int enroll(FittingVO vo) throws Exception;

//	1-1.피팅 등록폼에 내 옷장에 있는 사진 가져오기
	public List<ImageVO> getImages(@Param("member_id")String id) throws Exception;
}
