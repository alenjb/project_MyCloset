package com.mycloset.closet.mapper;

import java.util.List;

import com.mycloset.closet.vo.ClosetVO;

public interface ClosetMapper {

	// 옷 등록
	public int enroll(ClosetVO vo) throws Exception;
	
	//옷 수정
	public int update(ClosetVO vo) throws Exception;
	
	//옷 보기
	public List<ClosetVO> view(String id) throws Exception;

}
