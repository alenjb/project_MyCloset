package com.mycloset.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycloset.qna.vo.QnaVO;
import com.mycloset.util.Critera;
import com.webjjang.util.PageObject;

public interface QnaMapper {

	// pageObject 버전
	// 1.리스트(list)
	public List<QnaVO> list(PageObject pageObject) throws Exception;

//	//1.리스트(list)
//	public List<QnaVO> list(Critera cri) throws Exception;

	// 총 게시물 개수 세기
	public int getTotalNum(@Param("cri")Critera cri) throws Exception;

	// 2.글보기(view)
	public QnaVO view(long no) throws Exception;

	// 3.글쓰기(write)
	public int write(QnaVO vo) throws Exception;
	
	// 3-1.답변쓰기(writeAnswer)
	public int writeAnswer(QnaVO vo) throws Exception;
	
	// 4. 수정(update)
	public int update(QnaVO vo) throws Exception;
	
	// 4. 답변수정(update)
	public int updateAnswer(QnaVO vo) throws Exception;

	// 5. 삭제(delete)

	public int delete(long no) throws Exception;

	// 6. 페이지 처리와 함께 리스트를 가져오기
	public List<QnaVO> getListWithPaging(@Param("cri") Critera cri, @Param("startNum")int startNum);

}
