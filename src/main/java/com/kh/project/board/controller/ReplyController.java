package com.kh.project.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.board.service.ReplyFreeService;
import com.kh.project.board.service.ReplyNoticeService;
import com.kh.project.board.vo.ReplyFreeVO;
import com.kh.project.board.vo.ReplyNoticeVO;
import com.kh.project.member.vo.MemberVO;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Resource(name = "replyFreeService")
	private ReplyFreeService replyFreeService;

	@Resource(name = "replyNoticeService")
	private ReplyNoticeService replyNoticeService;

	// ==============================// 공지사항 //==============================//
	// ==============================// 공지사항 //==============================//
	// ==============================// 공지사항 //==============================//

	// 공지사항 댓글 등록
	@PostMapping("/noticeInsertReply")
	public String noticeInsertReply(ReplyNoticeVO replyNoticeVO, HttpSession session) {

		String writerNotice = ((MemberVO) session.getAttribute("loginInfo")).getMemberId();

		replyNoticeVO.setWriterNotice(writerNotice);

		replyNoticeService.insertReplyNotice(replyNoticeVO);

		return "redirect:/board/goNoticeDetail?boardNumNotice=" + replyNoticeVO.getBoardNumNotice();
	}

	// 공지사항 댓글 삭제
	@GetMapping("/deleteReplyNotice")
	public String deleteReplyNotice(ReplyNoticeVO replyNoticeVO, int replyNumNotice) {

		replyNoticeService.deleteReplyNotice(replyNumNotice);

		return "redirect:/board/goNoticeDetail?boardNumNotice=" + replyNoticeVO.getBoardNumNotice();
	}

	// ==============================// 자유게시판 //==============================//
	// ==============================// 자유게시판 //==============================//
	// ==============================// 자유게시판 //==============================//

	// 자유게시판 댓글 등록
	@PostMapping("/freeInsertReply")
	public String freeInsertReply(ReplyFreeVO replyFreeVO, HttpSession session) {

		String writerFree = ((MemberVO) session.getAttribute("loginInfo")).getMemberId();

		replyFreeVO.setWriterFree(writerFree);

		replyFreeService.insertReplyFree(replyFreeVO);

		return "redirect:/board/goFreeDetail?boardNumFree=" + replyFreeVO.getBoardNumFree();
	}

	// 자유게시판 댓글 삭제
	@GetMapping("/deleteReplyFree")
	public String deleteReplyFree(ReplyFreeVO replyFreeVO, int replyNumFree) {

		replyFreeService.deleteReplyFree(replyNumFree);

		return "redirect:/board/goFreeDetail?boardNumFree=" + replyFreeVO.getBoardNumFree();
	}

}
