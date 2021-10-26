package com.kh.project.mercenary.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;
import com.kh.project.mercenary.service.MercenaryService;
import com.kh.project.mercenary.vo.MercenaryVO;

// 윤인규, 1020 작성
// 윤인규, 1025 detail에서 지원, 수정 기능 구현중
@Controller
@RequestMapping("/mercenary")
public class MercenaryController {
	@Resource(name = "mercenaryService")
	private MercenaryService mercenaryService;
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//용병 구인 페이지로 이동
	@GetMapping("/recruit")
	public String goMercenaryRecruit(Model model, MercenaryVO mercenaryVO) {
		//구인 리스트 셀렉트
		model.addAttribute("mercRecruitList", mercenaryService.selectMercBoardList());
		return "mercenary/mercenary_recruit";
	}
	//용병 구인 상세보기 (모달)
	@GetMapping("/recruitDetail")
	public String recruitDetail(Model model, String mercenaryBoardCode, MercenaryVO mercenaryVO) {
		//구인 상세보기 조회
		model.addAttribute("mercVO", mercenaryService.selectMercDetail(mercenaryBoardCode));
		//상세보기 모달창 사이드,푸터 없애기 위해 리턴값에 logPage/ 추가 
		return "logPage/mercenary/mercenary_recruit_detail";
	}
	//용병 모집(구인) 등록 페이지로 이동
	@GetMapping("/recruitRegForm")
	public String goRecruitRegForm() {
		return "mercenary/mercenary_recruit_regform";
	}
	//용병 모집(구인) 등록
	@PostMapping("/recruitReg")
	public String recruitRegBoard(HttpSession session, MercenaryVO mercenaryVO, Model model) {
		//로그인한 사람 이름 가져와서 VO에 set
		String memberName = ((MemberVO)session.getAttribute("loginInfo")).getMemberName();
		mercenaryVO.setMercenaryBoardWriter(memberName);
		
		//게시글 등록 쿼리 실행
		mercenaryService.insertMercRecruit(mercenaryVO);
		
		//용병 구인 리스트 페이지로 이동
		return "redirect:/mercenary/recruit";
	}
	//용병 구인 신청하기
	@GetMapping("/updateRecruitCnt")
	public String updateRecruitCnt(Model model, MercenaryVO mercenaryVO) {
		//mercenaryService.updateMemberCnt(mercenaryVO);
		mercenaryService.insertMercRecruitList(mercenaryVO);
		return "redirect:/mercenary/recruit";
	}
	
	
	//용병 구직 페이지로 이동
	@GetMapping("/apply")
	public String goMercenaryApply(Model model) {
		//구직 리스트 셀렉트
		model.addAttribute("mercApplyList", mercenaryService.selectMercApplyList());
		return "mercenary/mercenary_apply";
	}
	//용병 신청(구직) 등록 페이지로 이동
	@GetMapping("/applyRegForm")
	public String goApplyRegForm() {
		return "mercenary/mercenary_apply_regform";
	}
	//용병 신청(구직) 등록
	@PostMapping("/applyReg")
	public String applyRegBoard(HttpSession session, MercenaryVO mercenaryVO, Model model) {
		//로그인한 사람 이름 가져와서 VO에 set
		String memberName = ((MemberVO)session.getAttribute("loginInfo")).getMemberName();
		mercenaryVO.setMercenaryApplyWriter(memberName);
		
		//게시글 등록 쿼리 실행
		mercenaryService.insertMercApply(mercenaryVO);
		
		//용병 구직 리스트 페이지로 이동
		return "redirect:/mercenary/apply";
	}
	//용병 구인 상세보기 (모달)
	@GetMapping("/applyDetail")
	public String applyDetail(Model model, String mercenaryApplyCode) {
		//구인 상세보기 조회
		model.addAttribute("mercVO", mercenaryService.selectMercApplyDetail(mercenaryApplyCode));
		return "logPage/mercenary/mercenary_apply_detail";
	}
}
