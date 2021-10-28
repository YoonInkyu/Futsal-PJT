package com.kh.project.board.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.board.service.BoardFreeService;
import com.kh.project.board.service.ReplyFreeService;
import com.kh.project.board.service.ReplyNoticeService;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Resource(name = "replyFreeService")
	private ReplyFreeService replyService;
	
	@Resource(name = "replyNoticeService")
	private ReplyNoticeService replyNoticeService;

	@GetMapping("/noticeInsertReply")
	public String noticeInsertReply() {
		return "board/board_notice_list";
	}

	@GetMapping("/freeInsertReply")
	public String freeInsertReply() {
		return "board/board_free_list";
	}

}
