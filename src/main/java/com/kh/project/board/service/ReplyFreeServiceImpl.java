package com.kh.project.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.vo.ReplyFreeVO;

@Service("replyFreeService")
public class ReplyFreeServiceImpl implements ReplyFreeService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReplyFree(ReplyFreeVO replyFreeVO) {
		return sqlSession.insert("replyMapper.insertReplyFree", replyFreeVO);
	}

	@Override
	public List<ReplyFreeVO> selectReplyFreeList(int boardNumFree) {
		return sqlSession.selectList("replyMapper.selectReplyFreeList", boardNumFree);
	}

	@Override
	public int deleteReplyFree(int replyNumFree) {
		return sqlSession.delete("replyMapper.deleteReplyFree", replyNumFree);
	}

}
