package com.jb.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jb.notice.mapper.NoticeMapper;
import com.jb.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

@Service
public class NoticeService {

	@Inject
	private NoticeMapper mapper;
	
	public List<NoticeVO> list(PageObject pageObject) throws Exception{
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		System.out.println("NoticeService.list()/pageObject - "+pageObject);
		return mapper.list(pageObject);
	}
	
	//2. view
	public NoticeVO view (long no) throws Exception{
		System.out.println("NoticeService.view().no, inc - "+no);
		return mapper.view(no);
	}
	//3. write
	public int write(NoticeVO vo)throws Exception{
		System.out.println("NoticeService.write().vo - "+vo);
		return mapper.write(vo);
	}
	
	//4.update
	public int update(NoticeVO vo) throws Exception{
		System.out.println("NoticeService.update().vo - "+vo);
		return mapper.update(vo);
	}
	
	//5.delete
	public int delete(int no) throws Exception{
		System.out.println("NoticeService.delete().no - "+no);
		return mapper.delete(no);	}
	
}
