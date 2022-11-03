package com.mycloset.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycloset.admin.vo.AdminVO;
import com.mycloset.util.Critera;

public interface AdminMapper {
	// 1. 회원목록 리스트(관리자만 볼 수 있음)
	public List<AdminVO> getListWithPaging(@Param("cri")Critera cri, @Param("startNum")int startNum) throws Exception;

	// 2. 회원정보보기(관리자 입장에서) / 내정보보기(회원 입장에서)
	public AdminVO view(@Param("member_id")String id) throws Exception;	

	// 3. 회원등급변경
	public void changeGrade(@Param("member_id")String member_id, @Param("grade")String grade)throws Exception;

	// 4. 회원 상태 변경
	public void changeStatus(@Param("member_id")String member_id, @Param("status")String status)throws Exception;

	// 5. 회원 강퇴
	public int delete(AdminVO vo) throws Exception;

	// 6. 총 개수 세기
	public int getTotalNum(@Param("cri")Critera cri) throws Exception;
}
