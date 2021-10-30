package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.ReplyFreeVO;

public interface ReplyFreeService {

	// 자유게시판 댓글 등록
	int insertReplyFree(ReplyFreeVO replyFreeVO);

	// 자유게시판 댓글 목록 조회
	List<ReplyFreeVO> selectReplyFreeList(int boardNumFree);

	// 자유게시판 댓글 삭제
	int deleteReplyFree(int replyNumFree);

}
