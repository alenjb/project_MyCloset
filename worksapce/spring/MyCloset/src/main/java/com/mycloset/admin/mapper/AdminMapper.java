package com.mycloset.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycloset.admin.vo.AdminVO;
import com.mycloset.util.Critera;

public interface AdminMapper {
	//페이징을 적용해 리스트 가져오기
	public List<AdminVO> getListWithPaging(@Param("cri")Critera cri, @Param("startNum")int startNum) throws Exception;
	//멤버 상세 보기
	public AdminVO view(@Param("member_id")String id) throws Exception;	
	//총 개수 세기
	public int getTotalNum(@Param("cri")Critera cri) throws Exception;
	//회원 등급 변경
	public void changeGrade(@Param("member_id")String member_id, @Param("grade")String grade)throws Exception;
	//회원 상태 변경
	public void changeStatus(@Param("member_id")String member_id, @Param("status")String status)throws Exception;
	//회원 강퇴
	public int delete(AdminVO vo) throws Exception;
}
