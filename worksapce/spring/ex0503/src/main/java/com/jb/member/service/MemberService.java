package com.jb.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jb.member.mapper.MemberMapper;
import com.jb.member.vo.LoginVO;
import com.jb.member.vo.MemberVO;
import com.webjjang.util.PageObject;
@Service
public class MemberService {

	//자동 DI
	@Inject
	private MemberMapper mapper;
	
	//회원가입
	public int write(MemberVO vo) throws Exception{
		return mapper.write(vo);
		
	}
	//로그인
	public LoginVO login(LoginVO invo) throws Exception{
		
		return mapper.login(invo);
	}
	
	//리스트
	public List<MemberVO> list(PageObject pageObject) throws Exception{
		//전체 데이터의 갯수를 구해서 pageObject에 넣는다
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	//아이디 체크
	public String idCheck(String id) throws Exception{
		return mapper.idCheck(id);
	}
	
	
}
