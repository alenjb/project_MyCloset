package com.jb.member.mapper;

import java.util.List;

import com.jb.member.vo.LoginVO;
import com.jb.member.vo.MemberVO;
import com.webjjang.util.PageObject;

public interface MemberMapper {

	// dao에서 작성한 메소드 형식으로 만들어준다.

	// 리스트
	public List<MemberVO> list(PageObject pageObject) throws Exception;

	// 1-2. 전체 데이터 개수
	// 검색 조건에 맞는 데이터를 가져오기 위해 pageObject를 파라미터로 받음
	public long getTotalRow(PageObject pageObject) throws Exception;

	// 보기
	public MemberVO view(long no) throws Exception;

	// 회원가입
	public int write(MemberVO vo) throws Exception;

	// 수정
	public int update(MemberVO vo) throws Exception;

	// 탈퇴
	public int delete(int no) throws Exception;
	
	//로그인 처리
	public LoginVO login(LoginVO invo) throws Exception;
	
	//아이디 중복체크
	public String idCheck(String id) throws Exception;
}
