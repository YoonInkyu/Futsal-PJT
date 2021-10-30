package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.BoardNoticeVO;

public interface BoardNoticeService {

	// 공지사항 목록 조회
	List<BoardNoticeVO> selectBoardNoticeList();

	// 공지사항 목록 상세 조회
	BoardNoticeVO selectBoardNoticeDetail(int boardNumNotice);

	// 공지사항 글쓰기
	int insertBoardNotice(BoardNoticeVO boardNoticeVO);

	// 조회수 증가
	void updateReadCntNotice(int boardNumNotice);
	
	// 공지사항 글 수정
	int updateBoardNotice(BoardNoticeVO boardNoticeVO);
	
	// 공지사항 글 삭제
	int deleteBoardNotice(BoardNoticeVO boardNoticeVO);
	
	

}
