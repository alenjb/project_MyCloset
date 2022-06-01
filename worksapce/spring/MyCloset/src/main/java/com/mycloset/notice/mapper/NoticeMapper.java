package com.mycloset.notice.mapper;

import java.util.List;

import com.mycloset.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

public interface NoticeMapper {

	//1.리스트(list)
	public List<NoticeVO> list(PageObject pageObject) throws Exception;
	
	//1-1 전체 데이터 개수(getTotalRow)
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	//2.글보기(view)
	public NoticeVO view(long no) throws Exception;
	
	//3.글쓰기(write)
	public int write(NoticeVO vo) throws Exception;
	
	
	//4. 수정(update)
	public int update(NoticeVO vo) throws Exception;
	
	
	//5. 삭제(delete)
	
	public int delete(int no) throws Exception;

}
