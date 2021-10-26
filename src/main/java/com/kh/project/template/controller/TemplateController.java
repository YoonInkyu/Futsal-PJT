//박성환 10/25 : 나의팀 사이드바 관련 추가 생성


package com.kh.project.template.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/templateLayout")
public class TemplateController {

	// 메인 화면 레이아웃
	@GetMapping("/main_page")
	public String mainPage() {
		return "mainPage/main_page";
	}

//	// 로그인 화면 레이아웃
//	@GetMapping("/templateLayout_login")
//	public String login() {
//		return "logPage/member/login";
//	}
//	
//	// 조인 화면 레이아웃
//	@GetMapping("/templateLayout_join")
//	public String join() {
//		return "logPage/member/join";
//	}
	
	// 나의팀 레이아웃
	@GetMapping("/templateLayout_myTeam")
	public String myTeam() {
		return "myTeam/team/submenu_team_manage";
	}


}
