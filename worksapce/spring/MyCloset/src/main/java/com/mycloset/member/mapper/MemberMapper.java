package com.mycloset.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycloset.fitting.vo.FittingVO;
import com.mycloset.member.vo.LoginVO;
import com.mycloset.member.vo.MemberVO;
import com.mycloset.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

public interface MemberMapper {

	//회원가입
	public int signUp(MemberVO vo) throws Exception;
	
	//회원가입 시 아이디 중복체크
	
	
	//로그인 폼
	
	//로그인 
	public LoginVO login(LoginVO vo) throws Exception;
	
	//회원 리스트
	public List<MemberVO> list(PageObject pageObject) throws Exception;
	//회원정보보기 / 내정보보기
	
	//회원등급변경
	
	//전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	//아이디 찾기
	public String findId(@Param("name")String name, @Param("email")String email) throws Exception;
	
	//비밀번호 찾기
	public String findPw(@Param("id")String id, @Param("name")String name, @Param("email")String email) throws Exception;
	
	//회원 정보 보여주기
	public MemberVO myPage(LoginVO vo) throws Exception;

	//회원정보 수정(update)
	public int update(MemberVO vo) throws Exception;

	//회원정보 수정(update)
	public int delete(MemberVO vo) throws Exception;
}
