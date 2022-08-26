package com.mycloset.myapp;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.mycloset.closet.service.ClosetService;
import com.mycloset.closet.vo.ClosetVO;
import com.mycloset.util.Critera;

import lombok.extern.log4j.Log4j;
@Log4j
public class ClosetMapperTest {
	@Inject
	ClosetService service;
	
	@Test
	public void testPaging() throws Exception{
		Critera cri = new Critera();
//		List<ClosetVO> list = service.getListWithPaging(cri);
		List<ClosetVO> listt = service.list("hello");
//		list.forEach(b -> log.info(b));
		listt.forEach(b -> log.info(b));
		
	}
}
