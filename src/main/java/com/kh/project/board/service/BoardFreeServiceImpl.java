package com.kh.project.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.vo.BoardFreeVO;
import com.kh.project.board.vo.BoardNoticeVO;
import com.kh.project.board.vo.FreeImgVO;

@Service("boardFreeService")
public class BoardFreeServiceImpl implements BoardFreeService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardFreeVO> selectBoardFreeList(BoardFreeVO boardFreeVO) {

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

	@Override
	public void insertImgsFree(BoardFreeVO boardFreeVO) {
		sqlSession.insert("boardMapper.insertImgsFree", boardFreeVO);
	}

	@Override
	public int selectNextNumberFree() {
		return sqlSession.selectOne("boardMapper.selectNextNumberFree");
	}

	@Override
	public int selectNextFreeNum() {
		return sqlSession.selectOne("boardMapper.selectNextFreeNum");
	}

	@Override
	public List<FreeImgVO> selectImgListFree(int boardNumFree) {
		return sqlSession.selectList("boardMapper.selectImgListFree", boardNumFree);

	}

	@Override
	public int selectBoardCntFree(BoardFreeVO boardFreeVO) {
		return sqlSession.selectOne("boardMapper.selectBoardCntFree", boardFreeVO);
	}

}
