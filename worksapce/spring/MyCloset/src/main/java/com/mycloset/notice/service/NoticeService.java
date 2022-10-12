package com.mycloset.notice.service;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.mycloset.notice.mapper.NoticeMapper;
import com.mycloset.notice.vo.NoticeVO;
import com.mycloset.util.Critera;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeService {

	@Inject
	private NoticeMapper mapper;

	// 페이징을 적용해 리스트 가져오기
	public List<NoticeVO> getListWithPaging(Critera cri, int limitMax)
			throws Exception {
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		limitMax = pageNum * amount;
		int startNum = limitMax - cri.getAmount() +1;
		return mapper.getListWithPaging(cri, startNum);
	}

	// 2.글보기(view)
	public NoticeVO view(long no) throws Exception {
		System.out.println("NoticeService.view().no, inc - " + no);
		return mapper.view(no);

	}

	// 3.글쓰기(write)
	public int write(NoticeVO vo) throws Exception {
		System.out.println("NoticeService.write().vo - " + vo);
		return mapper.write(vo);
	}

	// 4. 수정(update)
	public int update(NoticeVO vo) throws Exception {
		System.out.println("NoticeService.update().vo - " + vo);
		return mapper.update(vo);
	}

	// 5. 삭제(delete)
	public int delete(long no) throws Exception {
		System.out.println("NoticeService.delte().no-" + no);
		return mapper.delete(no);
	}
	//6. 총 게시물 개수 세기
	public int getTotalNum(Critera cri) throws Exception {
		return mapper.getTotalNum(cri);
	}

}
