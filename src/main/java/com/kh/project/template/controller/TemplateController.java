package com.kh.project.template.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/templateLayout")
public class TemplateController {

	// 메인 화면 레이아웃
	@GetMapping("/main_page")
	public String templateLayout() {
		return "mainPage/main_page";
	}

	// 로그인 화면 레이아웃
	@GetMapping("/templateLayout_login")
	public String templateLayout_login() {
		return "templateLayout/member/login";
	}
	
	// 조인 화면 레이아웃
	@GetMapping("/templateLayout_join")
	public String templateLayout_join() {
		return "templateLayout/member/join";
	}


}
