package com.kh.project.board.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("replyNoticeService")
public class ReplyNoticeServiceImpl implements ReplyNoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
