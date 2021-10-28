package com.kh.project.match.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.match.service.MatchService;
import com.kh.project.match.vo.MatchVO;

//윤인규 1027 매치 구현 시작

@Controller
@RequestMapping("/match")
public class MatchController {
	@Resource(name = "matchService")
	private MatchService matchService;
	
	//매치 리스트 조회(첫화면)
	@GetMapping("/matchList")
	public String matchList(Model model) {
		model.addAttribute("matchList", matchService.selectMatchList());
		return "match/matchList";
	}
	//매치 게시글 등록 폼으로 이동
	@GetMapping("/goMatchRegForm")
	public String goMatchRegForm() {
		return "match/match_regForm";
	}
	//매치 게시글 등록
	@PostMapping("/matchReg")
	public String matchReg(MatchVO matchVO) {
		matchService.insertMatchBoard(matchVO);
		return "redirect:/match/matchList";
	}

}
