package com.jb.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jb.board.mapper.BoardMapper;
import com.jb.board.vo.BoardVO;

@Service
public class BoardService {

	@Inject
	private BoardMapper mapper;
	
	public List<BoardVO> list() throws Exception{
		System.out.println("BoardService.list()");

		return mapper.list();
	}
	
	//2. view
	public BoardVO view (long no, int inc) throws Exception{
		System.out.println("BoardService.view().no, inc - "+no + ", "+inc);
		if(inc ==1) mapper.increase(no);
		return mapper.view(no);
	}
	
	
}
