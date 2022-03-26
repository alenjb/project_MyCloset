package com.webjjang.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webjjang.member.mapper.MemberMapper;
import com.webjjang.member.vo.LoginVO;
import com.webjjang.member.vo.MemberVO;
import com.webjjang.util.PageObject;

@Service
public class MemberService {
	
	//자동 DI
	@Inject
	private MemberMapper mapper;
	
	//회원 리스트
	public List<MemberVO> list( PageObject pageObject)throws Exception {
		//전체 데이터 개수를 구해서 pageObject에 넣는다.
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	//회원가입
	public int write(MemberVO vo) throws Exception{
		return mapper.write(vo);
	}
	//로그인
	public LoginVO login(LoginVO invo) throws Exception {
		return mapper.login(invo);
	}
	
	//아이디 중복 체크 -> 아이디를 가져오자
	public String idCheck(String id) throws Exception{
		return mapper.idCheck(id);
	}
}
