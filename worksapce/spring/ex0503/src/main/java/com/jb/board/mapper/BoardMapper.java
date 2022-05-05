package com.jb.board.mapper;

import java.util.List;

import com.jb.board.vo.BoardVO;

public interface BoardMapper {
	
	//dao에서 작성한 메소드 형식으로 만들어준다.
	
	//리스트
	public List<BoardVO> list() throws Exception;
	
	//보기
	public BoardVO view(long no) throws Exception;
	
	//조회수 1 증가
	public int increase(long no) throws Exception;
	
	//글쓰기
	public int write(BoardVO vo) throws Exception;
	
	//수정
	public int update(BoardVO vo) throws Exception;
	
	//삭제
	public int delete(int no) throws Exception;

}
