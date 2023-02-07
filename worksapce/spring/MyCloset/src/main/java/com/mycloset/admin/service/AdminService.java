package com.mycloset.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.admin.mapper.AdminMapper;
import com.mycloset.admin.vo.AdminVO;
import com.mycloset.util.Critera;

@Service
public class AdminService {

	@Inject
	private AdminMapper mapper;

	// 1. 페이징을 적용한 회원목록 리스트 가져오기(관리자만 볼 수 있음)
	public List<AdminVO> getListWithPaging(Critera cri) throws Exception {
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		//한 페이지 최대 개수
		int limitMax = pageNum * amount;
		int startNum = limitMax - cri.getAmount();
		return mapper.getListWithPaging(cri, startNum);
	}
	
	// 2. 회원정보보기(관리자 입장에서) / 내정보보기(회원 입장에서)
	public AdminVO view(String id) throws Exception{
		return mapper.view(id);
	}
	
	
	// 3. 회원등급변경
	public void changeGrade(String member_id, String grade)throws Exception{
		mapper.changeGrade(member_id, grade);
	}
	
	// 4. 회원 상태 변경
	public void changeStatus(String member_id, String status)throws Exception{
		mapper.changeStatus(member_id, status);
	}
	
	// 5. 회원 강퇴
	public int delete(AdminVO vo) throws Exception{
		return mapper.delete(vo);
	}

	// 6. 총 개수 세기
	public int getTotalNum(Critera cri) throws Exception {
		return mapper.getTotalNum(cri);
	}
}
