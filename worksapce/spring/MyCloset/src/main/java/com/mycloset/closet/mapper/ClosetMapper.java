package com.mycloset.closet.mapper;

import com.mycloset.closet.vo.ClosetVO;

public interface ClosetMapper {

	// 옷 등록
	public int enroll(ClosetVO vo) throws Exception;

}
