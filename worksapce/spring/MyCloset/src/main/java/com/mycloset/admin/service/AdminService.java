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
	public List<AdminVO> getListWithPaging(@Param("cri") Critera cri, @Param("limitMax") int limitMax)
			throws Exception {
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		limitMax = pageNum * amount;
		return mapper.getListWithPaging(cri, limitMax);
	}
	
	//멤버 상세 보기
	public AdminVO view(String id) throws Exception{
		return mapper.view(id);
	}
	
	// 총 개수 세기
	public int getTotalNum() throws Exception {
		return mapper.getTotalNum();
	}
}
