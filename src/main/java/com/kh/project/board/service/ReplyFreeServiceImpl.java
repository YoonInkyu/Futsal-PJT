package com.kh.project.board.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("replyFreeService")
public class ReplyFreeServiceImpl implements ReplyFreeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
