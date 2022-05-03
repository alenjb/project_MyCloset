package com.mycloset.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.member.mapper.MemberMapper;
import com.mycloset.member.vo.MemberVO;

@Service
public class MemberService {
	
	@Inject
	private MemberMapper mapper;
	
	public List<MemberVO> list() throws Exception{
		System.out.println("boardService.list()");

		return mapper.list();
		
	}

}
