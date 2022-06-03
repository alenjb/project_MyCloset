package com.jb.notice.mapper;

import java.util.List;

import com.jb.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;


public interface NoticeMapper {

	// dao에서 작성한 메소드 형식으로 만들어준다.

	// 리스트
	public List<NoticeVO> list(PageObject pageObject) throws Exception;

	// 1-2. 전체 데이터 개수
	// 검색 조건에 맞는 데이터를 가져오기 위해 pageObject를 파라미터로 받음
	public long getTotalRow(PageObject pageObject) throws Exception;

	// 보기
	public NoticeVO view(long no) throws Exception;

	// 글쓰기
	public int write(NoticeVO vo) throws Exception;

	// 수정
	public int update(NoticeVO vo) throws Exception;

	// 삭제
	public int delete(int no) throws Exception;

}