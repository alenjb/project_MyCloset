package com.mycloset.fitting.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycloset.fitting.vo.FittingVO;
import com.mycloset.fitting.vo.ImageVO;
import com.mycloset.util.Critera;

public interface FittingMapper {

//	1. 피팅 등록
	public int enroll(FittingVO vo) throws Exception;

//	1-1.피팅 등록폼에 내 옷장에 있는 사진 가져오기
	public List<ImageVO> getImages(@Param("member_id") String id) throws Exception;

//	3. 피팅 보기
	public FittingVO view(@Param("member_id") String id, @Param("fitting_id") int num) throws Exception;

//	4. 피팅 수정
	public int update(FittingVO vo) throws Exception;

//	5. 피팅 삭제
	public int delete(FittingVO vo) throws Exception;
	
	// 페이지 처리와 함께 리스트를 가져오기
	public List<FittingVO> getListWithPaging(@Param("cri") Critera cri, @Param("startNum")int startNum);

	// 범위조건과 페이징 처리를 적용한 리스트를 가져오기
	public List<FittingVO> getRangeListWithPaging(@Param("cri") Critera cri, @Param("startNum")int startNum, @Param("openRange")String openRange);

	
	// 총 피팅 개수 세기
	public int getTotalNum(@Param("cri")Critera cri) throws Exception;

	// 옷 아이디 가져오기
	public HashMap<String, String> getClothesIdAndPrice(@Param("member_id")String member_id, @Param("outer_clothes_photo")String outer_clothes_photo, @Param("top_clothes_photo")String top_clothes_photo, @Param("bottom_clothes_photo")String bottom_clothes_photo) throws Exception;
	
	//모든 public 피팅 가져오기
	public List<FittingVO> getAllPublicFitting() throws Exception;
	
	// 모든 피팅 가져오기
	public List<FittingVO> list(String id)throws Exception;
}
