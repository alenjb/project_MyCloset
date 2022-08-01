package com.mycloset.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.closet.mapper.ClosetMapper;
import com.mycloset.closet.vo.ClosetVO;

@Service
public class ClosetService {
	
	//MemberMapper 주입
	@Inject
	private ClosetMapper mapper;
	
	// 옷 등록
	public int enroll(ClosetVO vo) throws Exception{
		return mapper.enroll(vo);
	}
	
//	//회원 리스트
//	public List<MemberVO> list(PageObject object) throws Exception{
//		object.setTotalRow(mapper.getTotalRow(object));
//		return mapper.list(object);
//	}
//	
//	//마이 페이지 개인정보 보여주기(view)
//	public MemberVO myPage(LoginVO vo) throws Exception{
//		return mapper.myPage(vo);
//	}
//	
//	//마이페이지 개인정보 수정
//	public int update(MemberVO vo)throws Exception{
//		System.out.println("MemberService.update().vo - "+vo);
//		return mapper.update(vo);
//	}
//	
//	//마이페이지 회원 탈퇴
//	public int delete(MemberVO vo) throws Exception{
//		System.out.println("MemberService.delete().vo - "+vo);
//		return mapper.delete(vo);
//	}
}
