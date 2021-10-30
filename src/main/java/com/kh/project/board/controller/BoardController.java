package com.kh.project.board.controller;

import java.util.Calendar;
import java.util.Iterator;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.board.service.BoardFreeService;
import com.kh.project.board.service.BoardNoticeService;
import com.kh.project.board.service.ReplyFreeService;
import com.kh.project.board.service.ReplyNoticeService;
import com.kh.project.board.vo.BoardNoticeVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Resource(name = "boardFreeService")
	private BoardFreeService boardFreeService;

	@Resource(name = "boardNoticeService")
	private BoardNoticeService boardNoticeService;

	@Resource(name = "replyFreeService")
	private ReplyFreeService replyFreeService;

	@Resource(name = "replyNoticeService")
	private ReplyNoticeService replyNoticeService;

	// ==============================// 공지사항 //==============================//
	// ==============================// 공지사항 //==============================//
	// ==============================// 공지사항 //==============================//
	// 공지사항 리스트로 이동
	@GetMapping("/goNoticeList")
	public String goNoticeList(Model model) {

		model.addAttribute("noticeList", boardNoticeService.selectBoardNoticeList());

		return "board/board_notice_list";
	}

	// 공지사항 상세 페이지로 이동
	@GetMapping("/goNoticeDetail")
	public String goNoticeDetail(Model model, int boardNumNotice) {

		model.addAttribute("noticeInfo", boardNoticeService.selectBoardNoticeDetail(boardNumNotice));

		// 댓글 조회
		model.addAttribute("replyNoticeList", replyNoticeService.selectReplyNoticeList(boardNumNotice));

		// 조회수 증가
		boardNoticeService.updateReadCntNotice(boardNumNotice);

		return "board/board_notice_detail";
	}

	// 공지사항 글 쓰기 폼으로 이동
	@GetMapping("/goNoticeWriteForm")
	public String goNoticeWriteForm(Model model) {

		model.addAttribute("nowDate", getNowDateToString());

		return "board/board_notice_write_form";

	}

	// 공지사항 글 쓰기
	@PostMapping("/noticeWriteForm")
	public String noticeWriteForm(BoardNoticeVO boardNoticeVO, MultipartHttpServletRequest multi) {

		Iterator<String> inputNames = multi.getFileNames();

		// 첨부될 폴더(집 경로, 다른데서 할시 경로 변경 할것!!!)
		String uploadPath = "C:\\Users\\PSH\\git\\ProjectTest\\src\\main\\webapp\\resources\\img\\board\\";

		boardNoticeService.insertBoardNotice(boardNoticeVO);

		return "redirect:/board/goNoticeList";

	}

	// 공지사항 글 수정 폼으로 이동
	@GetMapping("/goUpdateBoardNotice")
	public String goUpdateBoardNotice(Model model, int boardNumNotice) {

		model.addAttribute("nowDate", getNowDateToString());

		model.addAttribute("noticeInfo", boardNoticeService.selectBoardNoticeDetail(boardNumNotice));

		return "board/board_notice_update_form";

	}

	// 공지사항 글 수정
	@PostMapping("/updateBoardNotice")
	public String updateBoardNotice(BoardNoticeVO boardNoticeVO) {

		boardNoticeService.updateBoardNotice(boardNoticeVO);

		return "redirect:/board/goNoticeList";

	}

	// 공지사항 글 삭제
	@GetMapping("/deleteBoardNotice")
	public String deleteBoardNotice(BoardNoticeVO boardNoticeVO) {

		boardNoticeService.deleteBoardNotice(boardNoticeVO);

		return "redirect:/board/goNoticeList";

	}

	// ==============================// 자유게시판 //==============================//
	// ==============================// 자유게시판 //==============================//
	// ==============================// 자유게시판 //==============================//
	// 자유게시판으로 이동
	@GetMapping("/goFreeList")
	public String goFreeList() {

		return "board/board_free_list";

	}

	// ==============================// 오늘 날짜 메소드 //==============================//
	// ==============================// 오늘 날짜 메소드 //==============================//
	// ==============================// 오늘 날짜 메소드 //==============================//
	private String getNowDateToString() {

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);

		String strMonth = String.valueOf(month);

		if (month < 10) {
			strMonth = "0" + strMonth;
		}

		String strDate = String.valueOf(date);

		if (date < 10) {
			strDate = "0" + strDate;
		}

		return year + "-" + strMonth + "-" + strDate;
	}

}
