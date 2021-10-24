package com.kh.project.mercenary.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;
import com.kh.project.mercenary.service.MercenaryService;
import com.kh.project.mercenary.vo.MercenaryVO;

// 윤인규, 1020 작성
@Controller
@RequestMapping("/mercenary")
public class MercenaryController {
	@Resource(name = "mercenaryService")
	private MercenaryService mercenaryService;
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//용병 구인 페이지로 이동
	@GetMapping("/recruit")
	public String goMercenaryRecruit(Model model, HttpSession session, MercenaryVO mercenaryVO, String mercenaryBoardCode) {
		//로그인 정보 가져와서 mercenaryVO에 멤버코드 set(되는지 확인해봐야함.)
		//MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		//model.addAttribute("loginInfo", mercenaryService.selectLoginInfo(memberVO.getMemberCode()));
		
		//구인 리스트 셀렉트
		model.addAttribute("mercRecruitList", mercenaryService.selectMercBoardList());
		
		
		return "mercenary/mercenary_recruit";
	}
	@GetMapping("/recruitDetail")
	public String recruitDetail(Model model, String mercenaryBoardCode) {
		//구인 상세보기 모달 셀렉트
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
		//작성자 정보 가져와서 용병VO에 set
		//MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		//mercenaryVO.setMemberCode(memberVO.getMemberCode());
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
		//작성자 정보 가져와서 용병VO에 set
		//MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		//mercenaryVO.setMemberCode(memberVO.getMemberCode());
		//게시글 등록 쿼리 실행
		mercenaryService.insertMercApply(mercenaryVO);
		
		//용병 구직 리스트 페이지로 이동
		return "redirect:/mercenary/apply";
	}
	
}
