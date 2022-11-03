package com.mycloset.fitting.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.fitting.mapper.FittingMapper;
import com.mycloset.fitting.vo.FittingVO;
import com.mycloset.fitting.vo.ImageVO;
import com.mycloset.util.Critera;

@Service
public class FittingService {
	@Inject
	FittingMapper mapper;

//	1-1. 페이징을 적용해 리스트 가져오기
	public List<FittingVO> getListWithPaging(Critera cri) throws Exception{
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		//한 페이지 최대 개수
		int limitMax= pageNum * amount; 
		int startNum = limitMax - cri.getAmount() +1;
		return mapper.getListWithPaging(cri, startNum);
	}
//	1-2. 범위조건과 페이징을 적용해 리스트 가져오기
	public List<FittingVO> getRangeListWithPaging(Critera cri, String openRange) throws Exception{
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		int limitMax= pageNum * amount; 
		int startNum = limitMax - cri.getAmount() +1;
		return mapper.getRangeListWithPaging(cri, startNum, openRange);
	}

//	1-3. 피팅 등록폼에 내 옷장에 있는 사진 가져오기
	public List<ImageVO> getImages(String id) throws Exception {
		return mapper.getImages(id);
	}

// 	1-4. 모든 피팅 가져오기
	public List<FittingVO> list(String id)throws Exception{
		return mapper.list(id);
	}

//	2. 피팅 등록
	public int enroll(FittingVO vo) throws Exception {
		return mapper.enroll(vo);
	}

//	3. 자신의 피팅 보여주기(view)
	public FittingVO view(String id, int num) throws Exception{
		return mapper.view(id, num);
	}

// 4. 피팅 수정
	public int update(FittingVO vo)throws Exception{
		return mapper.update(vo);
	}
	
//	5. 피팅 삭제
	public int delete(FittingVO vo) throws Exception{
			return mapper.delete(vo);
	}

//	6. 옷 아이디 가져오기
	public HashMap<String, String> getClothesIdAndPrice(String member_id, String outer_clothes_photo, String top_clothes_photo, String bottom_clothes_photo) throws Exception{
		return mapper.getClothesIdAndPrice(member_id, outer_clothes_photo, top_clothes_photo, bottom_clothes_photo);
	}	

//	7. 총 피팅 개수 세기
	public int getTotalNum(Critera cri) throws Exception {
		return mapper.getTotalNum(cri);
	}

	
}
