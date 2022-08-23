package com.mycloset.closet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.util.Critera;

public interface ClosetMapper {

	// 옷 등록
	public int enroll(ClosetVO vo) throws Exception;
	
	//옷 리스트
	public List<ClosetVO> list(String id) throws Exception;

	//페이지 처리와 함께 리스트를 가져오기
	public List<ClosetVO> getListWithPaging(@Param("cri")Critera cri, @Param("limitMax")int limitMax);
	
	//옷 수정
	public int update(ClosetVO vo) throws Exception;
	
	//옷 보기
	public List<ClosetVO> view(String id, int num) throws Exception;
	
	//총 옷 개수 세기
	public int getTotalNum() throws Exception;
}
