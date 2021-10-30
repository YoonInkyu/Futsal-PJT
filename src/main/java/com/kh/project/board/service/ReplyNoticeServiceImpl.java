package com.kh.project.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.vo.ReplyNoticeVO;

@Service("replyNoticeService")
public class ReplyNoticeServiceImpl implements ReplyNoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReplyNotice(ReplyNoticeVO replyNoticeVO) {
		return sqlSession.insert("replyMapper.insertReplyNotice", replyNoticeVO);
	}

	@Override
	public List<ReplyNoticeVO> selectReplyNoticeList(int boardNumNotice) {
		return sqlSession.selectList("replyMapper.selectReplyNoticeList", boardNumNotice);
	}

	@Override
	public int deleteReplyNotice(int replyNumNotice) {
		return sqlSession.delete("replyMapper.deleteReplyNotice", replyNumNotice);
	}
	
}
