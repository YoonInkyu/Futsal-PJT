package com.kh.project.board.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Resource(name = "boardService")
	private BoardService boardService;

	@GetMapping("/noticeList")
	public String noticeList() {
		return "board/board_notice_list";
	}

	@GetMapping("/freeList")
	public String freeList() {
		return "board/board_free_list";
	}

}
