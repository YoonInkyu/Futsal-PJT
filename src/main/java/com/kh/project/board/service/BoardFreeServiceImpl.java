package com.kh.project.board.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardFreeService")
public class BoardFreeServiceImpl implements BoardFreeService {

	@Autowired
	private SqlSessionTemplate sqlSession;

}
