package com.mycloset.member.mapper;
//이 패키지와 똑같은 경로로 resources에 mapper 만들어야함

import java.util.List;

import com.mycloset.member.vo.MemberVO;

public interface MemberMapper {
	
	//1. 리스트
	public List<MemberVO> list() throws Exception;

}
