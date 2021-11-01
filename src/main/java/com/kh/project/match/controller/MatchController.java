package com.kh.project.match.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.common.util.CurrentDateTime;
import com.kh.project.match.service.MatchService;
import com.kh.project.match.vo.MatchManageVO;
import com.kh.project.match.vo.MatchResultVO;
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
	public String matchList(Model model, MatchVO matchVO) {
		//전체 데이터 수
		int dataCnt = matchService.selectMatchCnt(matchVO);
		matchVO.setTotalCnt(dataCnt);
		//페이징 처리
		matchVO.setPageInfo();
		model.addAttribute("matchList", matchService.selectMatchList(matchVO));
		return "match/matchList";
	}
	//검색 조건 사용했을 때 리스트 조회
	@PostMapping("/matchList")
	public String matchList2(Model model, MatchVO matchVO) {
		//전체 데이터 수
		int dataCnt = matchService.selectMatchCnt(matchVO);
		matchVO.setTotalCnt(dataCnt);
		//페이징 처리
		matchVO.setPageInfo();
		model.addAttribute("matchList", matchService.selectMatchList(matchVO));
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
		model.addAttribute("today", CurrentDateTime.today());
		//팀이 있는 경우 매치 등록 폼으로 이동
		return "match/match_regForm";
	}
	//매치 게시글 등록
	@PostMapping("/matchReg")
	public String matchReg(MatchVO matchVO, HttpSession session) {
		//로그인 한 사람 팀 이름을 작성팀으로 넣기 위해 matchVO에 set
		String teamName = ((MemberVO)session.getAttribute("loginInfo")).getTeamName();
		matchVO.setMatchWriter(teamName);
		//로그인 한 사람 팀 코드를 작성팀으로 넣기 위해 matchVO에 set
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		matchVO.setTeamCode(teamCode);
		
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
		//매치결과
		model.addAttribute("matchResult", matchService.selectResult(matchCode));
		return "logPage/match/match_detail";
	}
	//매치 수정하기 ajax 처리
	@ResponseBody
	@PostMapping("/matchDetailAjax")
	public MatchVO matchDetailAjax(String matchCode) {
		return matchService.selectMatchDetail(matchCode);
	}
	//매치 상세보기 수정
	@PostMapping("/matchDetailUpdate")
	public String matchDetailUpdate(MatchVO matchVO) {
		matchService.updateDetail(matchVO);
		return "redirect:/match/matchList";
	}
	
	//매치 신청하기
	@GetMapping("/updateApplyMatch")
	public String updateApplyMatch(MatchManageVO matchManageVO, HttpSession session) {
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		matchManageVO.setTeamCodeAway(teamCode);
		matchService.insertApplyMatch(matchManageVO);
		return "redirect:/match/matchList";
	}
	
	//매치 수락
	@GetMapping("/updateResponse")
	public String updateResponse(MatchManageVO matchManageVO) {
		matchService.updateResponse(matchManageVO);
		return "redirect:/match/matchList";
	}
	
	//매치 결과 등록
	@PostMapping("/insertResult")
	public String insertResult(MatchResultVO matchResultVO) {
		// 오류는 안나는데, 랭크 update가 안됨... 자바에서 실행된 쿼리 DB에서 그대로 실행하면 업데이트도 됨. WHY?
		matchService.insertResult(matchResultVO);
		//insertResult 쿼리로 한번에 처리
		//int a = matchService.updateRank(matchVO);
		return "redirect:/match/matchList";
	}

	//매치 삭제
	@GetMapping("/deleteMatch")
	public String deleteMatch(String matchCode) {
		matchService.deleteMatch(matchCode);
		return "redirect:/match/matchList";
	}

}
