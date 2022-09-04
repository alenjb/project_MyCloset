package com.mycloset.fitting.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.fitting.mapper.FittingMapper;
import com.mycloset.fitting.vo.FittingVO;

@Service
public class FittingService {
	@Inject
	FittingMapper mapper;
	
//	1. 피팅 등록
		public int enroll(FittingVO vo) throws Exception{
			return mapper.enroll(vo);
		}
}
