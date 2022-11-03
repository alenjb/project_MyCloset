package com.mycloset.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycloset.qna.vo.QnaVO;
import com.mycloset.util.Critera;

public interface QnaMapper {


// 1. 페이지 처리와 함께 리스트를 가져오기
	public List<QnaVO> getListWithPaging(@Param("cri") Critera cri, @Param("startNum")int startNum);


// 2.글보기(view)
	public QnaVO view(long no) throws Exception;

// 3.글쓰기(write)
	// 3-1.질문 등록(write)
	public int write(QnaVO vo) throws Exception;
	
	// 3-2.답변 등록(writeAnswer)
	public int writeAnswer(QnaVO vo) throws Exception;
	
// 4. 수정(update)
	
	//4-1. 질문수정
	public int update(QnaVO vo) throws Exception;
	
	// 4-2. 답변수정(update)
	public int updateAnswer(QnaVO vo) throws Exception;

// 5. 삭제(delete)
	public int delete(long no) throws Exception;

// 6. 총 게시물 개수 세기
	public int getTotalNum(@Param("cri")Critera cri) throws Exception;

}
