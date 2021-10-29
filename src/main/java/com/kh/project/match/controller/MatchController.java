package com.kh.project.match.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.match.service.MatchService;
import com.kh.project.match.vo.MatchManageVO;
import com.kh.project.match.vo.MatchVO;
import com.kh.project.member.vo.MemberVO;

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
	public String goMatchRegForm(HttpSession session, Model model) {
		String teamName = ((MemberVO)session.getAttribute("loginInfo")).getTeamName();

		//팀이 없는경우 알럿창과 함께 매치 리스트 조회 페이지로 이동
		if(teamName == null) {
			model.addAttribute("msg", "소속팀이 있어야 매치 등록이 가능합니다.");
			model.addAttribute("url", "matchList");
			return "match/alert";
		}
		
		//팀이 있는 경우 매치 등록 폼으로 이동
		return "match/match_regForm";
	}
	//매치 게시글 등록
	@PostMapping("/matchReg")
	public String matchReg(MatchVO matchVO, HttpSession session) {
		//로그인 한 사람 팀 이름을 작성팀으로 넣기 위해 matchVO에 set
		String teamName = ((MemberVO)session.getAttribute("loginInfo")).getTeamName();
		matchVO.setMatchWriter(teamName);
		
		matchService.insertMatchBoard(matchVO);
		return "redirect:/match/matchList";
	}
	//매치 상세보기
	@GetMapping("/matchDetail")
	public String matchDetail(String matchCode, Model model) {
		//게시글 정보
		model.addAttribute("matchVO", matchService.selectMatchDetail(matchCode));
		//매치신청 팀 리스트
		model.addAttribute("teamList", matchService.matchApplyList(matchCode));
		return "logPage/match/match_detail";
	}
	//매치 수정하기 ajax 처리
	@ResponseBody
	@PostMapping("/matchDetailAjax")
	public MatchVO matchDetailAjax(String matchCode) {
		return matchService.selectMatchDetail(matchCode);
	}
	//매치 상세보기 수정
	
	
	//매치 신청하기
	@GetMapping("/updateApplyMatch")
	public String updateApplyMatch(MatchManageVO matchManageVO, HttpSession session) {
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		matchManageVO.setTeamCodeAway(teamCode);
		matchService.insertApplyMatch(matchManageVO);
		return "redirect:/match/matchList";
	}
	

}
