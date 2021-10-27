package com.kh.project.match.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//윤인규 1027 매치 구현 시작

@Controller
@RequestMapping("/match")
public class MatchController {
	
	//매치 리스트 조회(첫화면)
	@GetMapping("/matchList")
	public String matchList() {
		
		return "match/matchList";
	}
	@GetMapping("/goMatchRegForm")
	public String goMatchRegForm() {
		return "match/match_regForm";
	}
	@PostMapping("/matchReg")
	public String matchReg() {
		
		return "";
	}

}
