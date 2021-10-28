package com.kh.project.board.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardNoticeService")
public class BoardNoticeServiceImpl implements BoardNoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;

}
