package com.mycloset.qna.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.qna.mapper.QnaMapper;
import com.mycloset.qna.vo.QnaVO;
import com.mycloset.util.Critera;

@Service
public class QnaService {

	@Inject
	private QnaMapper mapper;

	// 페이징을 적용해 리스트 가져오기
	public List<QnaVO> getListWithPaging(Critera cri)
			throws Exception {
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		int limitMax = pageNum * amount;
		int startNum = limitMax - cri.getAmount();
		return mapper.getListWithPaging(cri, startNum);
	}

	// 2.글보기(view)
	public QnaVO view(long no) throws Exception {
		return mapper.view(no);

	}

	// 3.글쓰기(write)
	public int write(QnaVO vo) throws Exception {
		return mapper.write(vo);
	}
	// 3-1 답변쓰기(writeAnswer)
	public int writeAnswer(QnaVO vo) throws Exception {
		return mapper.writeAnswer(vo);
	}


	// 4. 수정(update)
	public int update(QnaVO vo) throws Exception {
		return mapper.update(vo);
	}

	// 4-1. 답변수정(updateAnswer)
	public int updateAnswer(QnaVO vo) throws Exception {
		return mapper.updateAnswer(vo);
	}


	// 5. 삭제(delete)
	public int delete(long no) throws Exception {
		return mapper.delete(no);
	}
	//6. 총 게시물 개수 세기
	public int getTotalNum(Critera cri) throws Exception {
		return mapper.getTotalNum(cri);
	}
}
