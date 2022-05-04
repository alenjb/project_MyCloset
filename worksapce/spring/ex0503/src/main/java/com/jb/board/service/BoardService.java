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
		return mapper.list();
	}
}
