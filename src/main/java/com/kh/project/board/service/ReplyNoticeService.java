package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.ReplyNoticeVO;

public interface ReplyNoticeService {

	// 공지사항 댓글 등록
	int insertReplyNotice(ReplyNoticeVO replyNoticeVO);

	// 공지사항 댓글 목록 조회
	List<ReplyNoticeVO> selectReplyNoticeList(int boardNumNotice);

	// 공지사항 댓글 삭제
	int deleteReplyNotice(int replyNumNotice);

}
