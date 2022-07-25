package com.mycloset.notice.service;

import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.mycloset.notice.mapper.NoticeMapper;
import com.mycloset.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

@Service
public class NoticeService {
	
	@Inject
	private NoticeMapper mapper;
	
	//1.리스트(list)
	public List<NoticeVO> list(PageObject pageObject) throws Exception{
		System.out.println("NoticeService.list()/pageObject - "+pageObject);
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	//2.글보기(view)
	public NoticeVO view(long no) throws Exception{
		System.out.println("NoticeService.view().no, inc - "+no);
		return mapper.view(no);
		
	}
	
	//3.글쓰기(write)
	public int write(NoticeVO vo)throws Exception{
		System.out.println("NoticeService.write().vo - "+vo);
		return mapper.write(vo);
	}
	
	//4. 수정(update)
	public int update(NoticeVO vo)throws Exception{
		System.out.println("NoticeService.update().vo - "+vo);
		return mapper.update(vo);
	}
	
	//5. 삭제(delete)
	public int delete(long no)throws Exception{
		System.out.println("NoticeService.delte().no-"+no);
		return mapper.delete(no);
	}
		
}
