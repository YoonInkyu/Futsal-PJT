package com.kh.project.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
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
		return  "member/sample";
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
		return  "member/sample";
	}
	//로그아웃 하기
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return  "member/sample";
	}
}









