package com.mycloset.closet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.util.Critera;

public interface ClosetMapper {

	//1. 페이지 처리와 함께 리스트를 가져오기
	public List<ClosetVO> getListWithPaging(@Param("cri")Critera cri, @Param("startNum")int startNum);

	//2. 옷 보기
	public ClosetVO view(@Param("member_id")String id, @Param("clothes_id")int num) throws Exception;

	//3. 옷 등록
	public int enroll(ClosetVO vo) throws Exception;
	
	//4. 옷 수정
	public int update(ClosetVO vo) throws Exception;
	
	//5. 옷 삭제
	public int delete(ClosetVO vo) throws Exception;
	
	//6. 총 옷 개수 세기
	public int getTotalNum(@Param("cri")Critera cri) throws Exception;
	
//	//7. 옷 리스트
//	public List<ClosetVO> list(String id) throws Exception;
}
