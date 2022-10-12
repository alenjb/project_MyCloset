package com.mycloset.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.mycloset.admin.mapper.AdminMapper;
import com.mycloset.admin.vo.AdminVO;
import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.util.Critera;

@Service
public class AdminService {

	@Inject
	private AdminMapper mapper;

	// 페이징을 적용해 리스트 가져오기
	public List<AdminVO> getListWithPaging(Critera cri, int limitMax) throws Exception {
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		limitMax = pageNum * amount;
		int startNum = limitMax - cri.getAmount() +1;
		return mapper.getListWithPaging(cri, startNum);
	}
	
	//멤버 상세 보기
	public AdminVO view(String id) throws Exception{
		return mapper.view(id);
	}
	
	// 총 개수 세기
	public int getTotalNum(Critera cri) throws Exception {
		return mapper.getTotalNum(cri);
	}
	
	//등급 변경
	public void changeGrade(String member_id, String grade)throws Exception{
		mapper.changeGrade(member_id, grade);
	}
	//상태 변경
	public void changeStatus(String member_id, String status)throws Exception{
		mapper.changeStatus(member_id, status);
	}
	//회원 강퇴
	public int delete(AdminVO vo) throws Exception{
		return mapper.delete(vo);
	}
}
