package com.kh.project.board.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.board.service.BoardService;
import com.kh.project.board.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Resource(name = "replyService")
	private ReplyService replyService;

	@GetMapping("/noticeInsertReply")
	public String noticeInsertReply() {
		return "board/board_notice_list";
	}

	@GetMapping("/freeInsertReply")
	public String freeInsertReply() {
		return "board/board_free_list";
	}

}
