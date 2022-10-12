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
		int startNum = limitMax - cri.getAmount() +1;
		return mapper.getListWithPaging(cri, startNum);
	}
	
	
	//자신의 옷 보여주기(view)
	public ClosetVO view(String id, int num) throws Exception{
		return mapper.view(id, num);
	}
//	
	//옷 수정
	public int update(ClosetVO vo)throws Exception{
//		System.out.println("ClosetService.update().vo - "+vo);
		return mapper.update(vo);
	}
//	
	//옷 삭제
	public int delete(ClosetVO vo) throws Exception{
		System.out.println(vo);
		return mapper.delete(vo);
	}
	
	
	
	//총 옷 개수 세기
	public int getTotalNum(Critera cri) throws Exception {
		return mapper.getTotalNum(cri);
	}
}
