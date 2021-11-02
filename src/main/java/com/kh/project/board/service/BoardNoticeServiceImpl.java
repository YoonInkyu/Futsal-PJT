package com.kh.project.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.vo.BoardNoticeVO;
import com.kh.project.board.vo.NoticeImgVO;

@Service("boardNoticeService")
public class BoardNoticeServiceImpl implements BoardNoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardNoticeVO> selectBoardNoticeList() {

		return sqlSession.selectList("boardMapper.selectBoardNoticeList");
	}

	@Override
	public BoardNoticeVO selectBoardNoticeDetail(int boardNumNotice) {
		return sqlSession.selectOne("boardMapper.selectBoardNoticeDetail", boardNumNotice);
	}

	@Override
	public int insertBoardNotice(BoardNoticeVO boardNoticeVO) {
		return sqlSession.insert("boardMapper.insertBoardNotice", boardNoticeVO);
	}

	@Override
	public void updateReadCntNotice(int boardNumNotice) {
		sqlSession.update("boardMapper.updateReadCntNotice", boardNumNotice);
	}

	@Override
	public int updateBoardNotice(BoardNoticeVO boardNoticeVO) {
		return sqlSession.update("boardMapper.updateBoardNotice", boardNoticeVO);
	}

	@Override
	public int deleteBoardNotice(BoardNoticeVO boardNoticeVO) {
		return sqlSession.delete("boardMapper.deleteBoardNotice", boardNoticeVO);
	}

	@Override
	public int selectNextNumber() {
		return sqlSession.selectOne("boardMapper.selectNextNumber");
	}

	@Override
	public void insertImgs(BoardNoticeVO boardNoticeVO) {
		sqlSession.insert("boardMapper.insertImgs", boardNoticeVO);
	}

	@Override
	public int selectNextNoticeNum() {
		return sqlSession.selectOne("boardMapper.selectNextNoticeNum");
	}

}
