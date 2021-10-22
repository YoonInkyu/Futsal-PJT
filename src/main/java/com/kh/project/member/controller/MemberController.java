package com.kh.project.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//sample.jsp 페이지로 이동
	@GetMapping("/sampleJsp")
	public String sampleJsp() {
		return  "member/sample";
	}
	//회원가입 페이지로 이동
	@GetMapping("/goJoin")
	public String goJoin() {
		return  "member/join";
	}
	//회원가입 하기
	@PostMapping("/join")
	public String join(MemberVO memberVO) {
		memberService.join(memberVO);
		return  "mainPage/main_page";
	}
	//로그인 페이지로 이동
	@GetMapping("/goLogin")
	public String goLogin() {
		return  "member/login";
	}
	//로그인 하기
	@PostMapping("/goLogin")
	public String Login(MemberVO memberVO, HttpSession session) {
		MemberVO loginInfo = memberService.login(memberVO);
		session.setAttribute("loginInfo", loginInfo);
		return  "mainPage/main_page";
	}
	//로그아웃 하기
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return  "mainPage/main_page";
	}
	//마이페이지 가기
	@GetMapping("/myPage")
	public String mypage(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("member",memberService.myPage(memberVO.getMemberCode()));
		return  "member/my_page";
	}
	//마이페이지 가기
	@GetMapping("/goCorrectionMember")
	public String correctionMemberInfo(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("member",memberService.myPage(memberVO.getMemberCode()));
		return  "member/correction_member_info";
	}
	//멤버 블랙리스트 관리페이지
	@GetMapping("/goMemberBlacklist")
	public String goMemberBlacklist(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("black",memberService.memberBlackList(memberVO.getMemberCode()));
		return  "member/member_blacklist";
	}
}









