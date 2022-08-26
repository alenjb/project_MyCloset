package com.mycloset.closet.service;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.mycloset.closet.mapper.ClosetMapper;
import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.util.Critera;

@Service
public class ClosetService {
	
	//MemberMapper 주입
	@Inject
	private ClosetMapper mapper;
	
	// 옷 등록
	public int enroll(ClosetVO vo) throws Exception{
		return mapper.enroll(vo);
	}
	
//	옷 리스트
	public List<ClosetVO> list(String id) throws Exception{
		return mapper.list(id);
	}
//페이징을 적용해 리스트 가져오기
	public List<ClosetVO> getListWithPaging(@Param("cri")Critera cri, @Param("limitMax")int limitMax) throws Exception{
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		limitMax= pageNum * amount; 
		return mapper.getListWithPaging(cri, limitMax);
	}
	
	
	//마이 페이지 개인정보 보여주기(view)
	public List<ClosetVO> view(String id, int num) throws Exception{
		return mapper.view(id, num);
	}
//	
	//마이페이지 개인정보 수정
	public int update(ClosetVO vo)throws Exception{
		System.out.println("MemberService.update().vo - "+vo);
		return mapper.update(vo);
	}
//	
//	//마이페이지 회원 탈퇴
//	public int delete(MemberVO vo) throws Exception{
//		System.out.println("MemberService.delete().vo - "+vo);
//		return mapper.delete(vo);
//	}
	
	//총 옷 개수 세기
	public int getTotalNum() throws Exception {
		return mapper.getTotalNum();
	}
}
