package com.mycloset.notice.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.mycloset.notice.mapper.NoticeMapper;
import com.mycloset.notice.vo.NoticeVO;
import com.mycloset.util.Critera;
import com.webjjang.util.PageObject;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeService {
	
	@Inject
	private NoticeMapper mapper;

	// pageObject 버전
	//1.리스트(list)
	public List<NoticeVO> list(PageObject pageObject) throws Exception{
		System.out.println("NoticeService.list()/pageObject - "+pageObject);
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

//	//1.리스트(list)
//	public List<NoticeVO> list(Critera cri) throws Exception{
//		log.info("get List with criteria: "+cri);
//		return mapper.list(cri);
//	}

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
