package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.BoardFreeVO;

public interface BoardFreeService {

	// 자유게시판 목록 조회
	List<BoardFreeVO> selectBoardFreeList();

	// 자유게시판 목록 상세 조회
	BoardFreeVO selectBoardFreeDetail(int boardNumFree);

	// 자유게시판 글쓰기
	int insertBoardFree(BoardFreeVO boardFreeVO);

	// 조회수 증가
	void updateReadCntFree(int boardNumFree);

	// 자유게시판 글 수정
	int updateBoardFree(BoardFreeVO boardFreeVO);

	// 자유게시판 글 삭제
	int deleteBoardFree(BoardFreeVO boardFreeVO);

}
