package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.BoardNoticeVO;
import com.kh.project.board.vo.NoticeImgVO;

public interface BoardNoticeService {

	// 공지사항 목록 조회
	List<BoardNoticeVO> selectBoardNoticeList(BoardNoticeVO boardNoticeVO);

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

	// 공지사항 이미지
	void insertImgsNotice(BoardNoticeVO boardNoticeVO);

	// 공지사항 이미지 코드 조회
	int selectNextNumberNotice();

	// 공지사항 다음 넘버 조회
	int selectNextNoticeNum();

	// 공지사항 이미지 조회
	List<NoticeImgVO> selectImgListNotice(int boardNumNotice);

	// 게시글 전체 개수 조회
	int selectBoardCntNotice(BoardNoticeVO boardNoticeVO);

}
