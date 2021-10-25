package com.kh.project.mercenary.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.common.util.CurrentDateTime;
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
	public String goMercenaryRecruit(Model model, HttpSession session, MercenaryVO mercenaryVO) {
		//구인 리스트 셀렉트
		model.addAttribute("mercRecruitList", mercenaryService.selectMercBoardList());
		return "mercenary/mercenary_recruit";
	}
	//용병 구인 상세보기 (모달)
	@GetMapping("/recruitDetail")
	public String recruitDetail(Model model, String mercenaryBoardCode, HttpSession session, MercenaryVO mercenaryVO) {
		//로그인 한 사람과 게시글 작성자 구분하여 버튼 따로 주려고 하는데,
		//로그인한 사람 정보 셀렉트해보려 했으나 안됨.. 멤버코드는 제대로 들고 오는데...
		//매개변수가 멤버코드인데... memberVO, mercenaryVO 멤버코드에 담아서 셀렉트해도 안됨.... 뭐가 문제지ㅣㅣㅣㅣㅣㅣ??????
		//MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		//System.out.println(memberVO.getMemberCode());
		//mercenaryVO.setMemberCode(memberVO.getMemberCode());
		//model.addAttribute("loginInfo", mercenaryService.selectLoginInfo(memberVO.getMemberCode()));
		//구인 상세보기 조회
		model.addAttribute("mercVO", mercenaryService.selectMercDetail(mercenaryBoardCode));
		return "mercenary/mercenary_recruit_detail";
	}
	//용병 모집(구인) 등록 페이지로 이동
	@GetMapping("/recruitRegForm")
	public String goRecruitRegForm() {
		return "mercenary/mercenary_recruit_regform";
	}
	//용병 모집(구인) 등록
	@PostMapping("/recruitReg")
	public String recruitRegBoard(HttpSession session, MercenaryVO mercenaryVO, Model model) {
		//게시글 등록 쿼리 실행
		mercenaryService.insertMercRecruit(mercenaryVO);
		
		//용병 구인 리스트 페이지로 이동
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
		return "mercenary/mercenary_apply_detail";
	}
	
}
