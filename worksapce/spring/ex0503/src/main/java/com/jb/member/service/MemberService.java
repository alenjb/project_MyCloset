package com.jb.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jb.member.mapper.MemberMapper;
import com.jb.member.vo.LoginVO;
@Service
public class MemberService {

	//자동 DI
	@Inject
	private MemberMapper mapper;
	
	//로그인
	public LoginVO login(LoginVO invo) throws Exception{
		
		
		return mapper.login(invo);
	}
}
