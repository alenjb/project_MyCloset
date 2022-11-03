package com.mycloset.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycloset.notice.vo.NoticeVO;
import com.mycloset.util.Critera;

public interface NoticeMapper {

	// 1. 페이지 처리와 함께 리스트를 가져오기
	public List<NoticeVO> getListWithPaging(@Param("cri") Critera cri, @Param("startNum")int startNum);

	// 2.글보기(view)
	public NoticeVO view(long no) throws Exception;

	// 3.글쓰기(write)
	public int write(NoticeVO vo) throws Exception;

	// 4. 수정(update)
	public int update(NoticeVO vo) throws Exception;

	// 5. 삭제(delete)
	public int delete(long no) throws Exception;

	// 6. 총 게시물 개수 세기
	public int getTotalNum(@Param("cri")Critera cri) throws Exception;

}
