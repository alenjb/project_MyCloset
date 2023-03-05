package com.mycloset.closet.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.closet.mapper.ClosetMapper;
import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.util.Critera;

@Service
public class ClosetService {
	
	//MemberMapper 주입
	@Inject
	private ClosetMapper mapper;
	

	//	1. 페이징을 적용해 리스트 가져오기(list)
	public List<ClosetVO> getListWithPaging(Critera cri) throws Exception{
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		//한 페이지 최대 개수
		int limitMax = pageNum * amount; 
		int startNum = limitMax - cri.getAmount();
		return mapper.getListWithPaging(cri, startNum);
	}
	
//	1-1. 페이징, 아이디를 적용해 리스트 가져오기(list)
	public List<ClosetVO> getListWithPagingAndId(Critera cri, String member_id) throws Exception{
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		//한 페이지 최대 개수
		int limitMax = pageNum * amount; 
		int startNum = limitMax - cri.getAmount();
		
		return mapper.getListWithPagingAndId(cri, startNum, member_id);
	}

	//2. 옷 상세 보기
	public ClosetVO view(String id, int num) throws Exception{
		return mapper.view(id, num);
	}

	//3. 옷 등록
	public int enroll(ClosetVO vo) throws Exception{
		return mapper.enroll(vo);
	}	
	
	//4. 옷 수정
	public int update(ClosetVO vo)throws Exception{
		return mapper.update(vo);
	}
	
	//5. 옷 삭제
	public int delete(ClosetVO vo) throws Exception{
		return mapper.delete(vo);
	}
	
	//6. 총 옷 개수 세기
	public int getTotalNum(Critera cri) throws Exception {
		return mapper.getTotalNum(cri);
	}
	
//	//7. 옷 리스트
//	public List<ClosetVO> list(String id) throws Exception{
//		return mapper.list(id);
//	}

}
