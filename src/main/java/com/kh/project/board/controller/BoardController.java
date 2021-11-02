package com.kh.project.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.board.service.BoardFreeService;
import com.kh.project.board.service.BoardNoticeService;
import com.kh.project.board.service.ReplyFreeService;
import com.kh.project.board.service.ReplyNoticeService;
import com.kh.project.board.vo.BoardFreeVO;
import com.kh.project.board.vo.BoardNoticeVO;
import com.kh.project.board.vo.NoticeImgVO;
import com.kh.project.common.util.CurrentDateTime;

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

		// 상세 조회 시, 내용 부분 엔터 값 적용
		BoardNoticeVO result = boardNoticeService.selectBoardNoticeDetail(boardNumNotice);
		result.setContentNotice(result.getContentNotice().replace("\r\n", "<br>"));
		model.addAttribute("noticeInfo", result);

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
		System.out.println("noticeWriteForm 오니");
		Iterator<String> inputNames = multi.getFileNames();

		// 첨부될 폴더(집 경로, 다른데서 할시 경로 변경 할것!!!)
		//String uploadPath = "C:\\Users\\PSH\\git\\ProjectTest\\src\\main\\webapp\\resources\\img\\board\\";
		// 첨부될 폴더(학원 경로, 다른데서 할시 경로 변경 할것!!!)
		String uploadPath = "C:\\Users\\kh202-09\\git\\ProjectTest\\src\\main\\webapp\\resources\\img\\board\\";
		
		List<NoticeImgVO> noticeImgList = new ArrayList<>();
		
		//다음에 들어갈 이미지 코드 조회 
		int nextImgCode = boardNoticeService.selectNextNumber();
		
		//다음에 들어갈 넘버 조회
		int nextNoticeNum = boardNoticeService.selectNextNoticeNum();
		
		while (inputNames.hasNext()) {
			String inputName = inputNames.next();

			// 실제첨부 기능
			try {
				if (inputName.equals("file")) {
//					multi.getFiles(inputName); //파일 여러개 들고 와서 파일즈
					List<MultipartFile> fileList = multi.getFiles(inputName); // 파일즈 확인
					// 여러개 파일을 받으니까 리스트에 담고 포문으로 업로드 한다.

					// 파일 목록(fileList)을 가져 와서 파일(file) 한개식을 업로드
					for (MultipartFile file : fileList) {

						String attachedFileName = CurrentDateTime.today() + "_" + file.getOriginalFilename();

						String uploadFile = uploadPath + attachedFileName;
//						String uploadFile = uploadPath + FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
						// 업로드시 날자 + 오리지널 파일명을 만드는 변수 업로드파일을 만든다 예)
						// 202110111212331122_a.jsp

						file.transferTo(new File(uploadFile)); // 한개씩 파일 이동(업로드)

						NoticeImgVO img = new NoticeImgVO();
						img.setNoticeImgCode("NOTICE_IMG_" + String.format("%03d", nextImgCode++));
						img.setNoticeImgOrignName(file.getOriginalFilename());
						img.setNoticeImgAttachedName(attachedFileName);
						img.setBoardNumNotice(nextNoticeNum);

						noticeImgList.add(img);
					}
				}


			}

			catch (IllegalStateException e) {

				e.printStackTrace();
			}

			catch (IOException e) {

				e.printStackTrace();
			}

		}
		
		//게시글 등록 쿼리
		boardNoticeService.insertBoardNotice(boardNoticeVO);
		
		
		
		//첨부파일 등록 쿼리
		boardNoticeVO.setNoticeImgList(noticeImgList);
		boardNoticeService.insertImgs(boardNoticeVO);

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

	// 자유게시판 리스트로 이동
	@GetMapping("/goFreeList")
	public String goFreeList(Model model) {

		model.addAttribute("freeList", boardFreeService.selectBoardFreeList());

		return "board/board_free_list";
	}

	// 자유게시판 상세 페이지로 이동
	@GetMapping("/goFreeDetail")
	public String goFreeDetail(Model model, int boardNumFree) {

		// 상세 조회 시, 내용 부분 엔터 값 적용
		BoardFreeVO result = boardFreeService.selectBoardFreeDetail(boardNumFree);
		result.setContentFree(result.getContentFree().replace("\r\n", "<br>"));
		model.addAttribute("freeInfo", result);

		model.addAttribute("freeInfo", boardFreeService.selectBoardFreeDetail(boardNumFree));

		// 댓글 조회
		model.addAttribute("replyFreeList", replyFreeService.selectReplyFreeList(boardNumFree));

		// 조회수 증가
		boardFreeService.updateReadCntFree(boardNumFree);

		return "board/board_free_detail";
	}

	// 자유게시판 글 쓰기 폼으로 이동
	@GetMapping("/goFreeWriteForm")
	public String goFreeWriteForm(Model model) {

		model.addAttribute("nowDate", getNowDateToString());

		return "board/board_free_write_form";

	}

	// 자유게시판 글 쓰기
	@PostMapping("/freeWriteForm")
	public String freeWriteForm(BoardFreeVO boardFreeVO, MultipartHttpServletRequest multi) {

		Iterator<String> inputNames = multi.getFileNames();

		// 첨부될 폴더(집 경로, 다른데서 할시 경로 변경 할것!!!)
		String uploadPath = "C:\\Users\\PSH\\git\\ProjectTest\\src\\main\\webapp\\resources\\img\\board\\";

		boardFreeService.insertBoardFree(boardFreeVO);

		return "redirect:/board/goFreeList";

	}

	// 자유게시판 글 수정 폼으로 이동
	@GetMapping("/goUpdateBoardFree")
	public String goUpdateBoardFree(Model model, int boardNumFree) {

		model.addAttribute("nowDate", getNowDateToString());

		model.addAttribute("freeInfo", boardFreeService.selectBoardFreeDetail(boardNumFree));

		return "board/board_free_update_form";

	}

	// 자유게시판 글 수정
	@PostMapping("/updateBoardFree")
	public String updateBoardFree(BoardFreeVO boardFreeVO) {

		boardFreeService.updateBoardFree(boardFreeVO);

		return "redirect:/board/goFreeList";

	}

	// 자유게시판 글 삭제
	@GetMapping("/deleteBoardFree")
	public String deleteBoardFree(BoardFreeVO boardFreeVO) {

		boardFreeService.deleteBoardFree(boardFreeVO);

		return "redirect:/board/goFreeList";

	}

//	모르겠음 물어 볼것

//	// 자유게시판 비밀 글, 비번 입력 페이지 이동
//	@GetMapping("/selectPwFree")
//	public String selectPwFree(BoardFreeVO boardFreeVO) {
//
//		return "/board/goFreeList";
//
//	}
//	
////	
////	// 비밀 글 비밀번호 입력 페이지 이동
////	else if (command.equals("/secretInputNum.bo")) {
////
////		// 선택한 게시글의 비밀번호를 가져온다.
////		String boardPw = request.getParameter("boardPw");
////		String boardNum = request.getParameter("boardNum");
////
////		request.setAttribute("boardPw", boardPw);
////		request.setAttribute("boardNum", boardNum);
////
////		path = "view/secret_result.jsp";
////
////	}
//	

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
