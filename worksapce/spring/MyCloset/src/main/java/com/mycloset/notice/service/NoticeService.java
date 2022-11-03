package com.mycloset.notice.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycloset.notice.mapper.NoticeMapper;
import com.mycloset.notice.vo.NoticeVO;
import com.mycloset.util.Critera;

@Service
public class NoticeService {

	@Inject
	private NoticeMapper mapper;

	// 1. 페이징을 적용해 리스트 가져오기(list)
	public List<NoticeVO> getListWithPaging(Critera cri) throws Exception {
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		//한 페이지 최대 개수
		int limitMax = pageNum * amount;
		int startNum = limitMax - cri.getAmount();
		return mapper.getListWithPaging(cri, startNum);
	}

	// 2.글보기(view)
	public NoticeVO view(long no) throws Exception {
		return mapper.view(no);
	}

	// 3.글쓰기(write)
	public int write(NoticeVO vo) throws Exception {
		return mapper.write(vo);
	}

	// 4. 수정(update)
	public int update(NoticeVO vo) throws Exception {
		return mapper.update(vo);
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
