package com.mycloset.fitting.mapper;

import com.mycloset.fitting.vo.FittingVO;

public interface FittingMapper {

//	1. 피팅 등록
		public int enroll(FittingVO vo) throws Exception;
}
