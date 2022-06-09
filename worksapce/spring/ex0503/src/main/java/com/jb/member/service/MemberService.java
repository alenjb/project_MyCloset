package com.jb.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jb.member.mapper.MemberMapper;
import com.jb.member.vo.LoginVO;
import com.jb.member.vo.MemberVO;
@Service
public class MemberService {

	//자동 DI
	@Inject
	private MemberMapper mapper;
	
	public int write(MemberVO vo) throws Exception{
		return mapper.write(vo);
		
	}
	//로그인
	public LoginVO login(LoginVO invo) throws Exception{
		
		return mapper.login(invo);
	}
}
