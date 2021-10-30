package com.kh.project.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.vo.BoardFreeVO;

@Service("boardFreeService")
public class BoardFreeServiceImpl implements BoardFreeService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardFreeVO> selectBoardFreeList() {

		return sqlSession.selectList("boardMapper.selectBoardFreeList");
	}

	@Override
	public BoardFreeVO selectBoardFreeDetail(int boardNumFree) {
		return sqlSession.selectOne("boardMapper.selectBoardFreeDetail", boardNumFree);
	}

	@Override
	public int insertBoardFree(BoardFreeVO boardFreeVO) {
		return sqlSession.insert("boardMapper.insertBoardFree", boardFreeVO);
	}

	@Override
	public void updateReadCntFree(int boardNumFree) {
		sqlSession.update("boardMapper.updateReadCntFree", boardNumFree);
	}

	@Override
	public int updateBoardFree(BoardFreeVO boardFreeVO) {
		return sqlSession.update("boardMapper.updateBoardFree", boardFreeVO);
	}

	@Override
	public int deleteBoardFree(BoardFreeVO boardFreeVO) {
		return sqlSession.delete("boardMapper.deleteBoardFree", boardFreeVO);
	}
}
