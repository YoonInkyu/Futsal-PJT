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
import com.kh.project.common.util.MessageService;
import com.kh.project.match.service.MatchService;
import com.kh.project.match.vo.MatchManageVO;
import com.kh.project.match.vo.MatchResultVO;
import com.kh.project.match.vo.MatchVO;
import com.kh.project.member.vo.MemberVO;
import com.kh.project.menu.service.MenuService;

//윤인규 1027 매치 구현 시작

@Controller
@RequestMapping("/match")
public class MatchController {
	@Resource(name = "matchService")
	private MatchService matchService;
	@Resource(name = "menuService")
	private MenuService menuService;
	
	//매치 리스트 조회(첫화면)
	@GetMapping("/matchList")
	public String matchList(Model model, MatchVO matchVO, String menuVideo, String menuName) {
		//전체 데이터 수
		int dataCnt = matchService.selectMatchCnt(matchVO);
		matchVO.setTotalCnt(dataCnt);
		//페이징 처리
		matchVO.setPageInfo();
		model.addAttribute("matchList", matchService.selectMatchList(matchVO));
		model.addAttribute("menuList", menuService.selectMenu());
		model.addAttribute("menuVideo", "video1");
		model.addAttribute("menuName", "매치 신청");
		return "match/matchList";
	}
	//검색 조건 사용했을 때 리스트 조회
	@PostMapping("/matchList")
	public String matchList2(Model model, MatchVO matchVO, String menuVideo, String menuName) {
		//전체 데이터 수
		int dataCnt = matchService.selectMatchCnt(matchVO);
		matchVO.setTotalCnt(dataCnt);
		//페이징 처리
		matchVO.setPageInfo();
		model.addAttribute("matchList", matchService.selectMatchList(matchVO));
		model.addAttribute("menuList", menuService.selectMenu());
		model.addAttribute("menuVideo", "video1");
		model.addAttribute("menuName", "매치 신청");
		return "match/matchList";
	}
	//매치 게시글 등록 폼으로 이동
	@GetMapping("/goMatchRegForm")
	public String goMatchRegForm(HttpSession session, Model model, String menuVideo, String menuName) {
		//로그인 여부 확인
		MemberVO memberCode = (MemberVO)session.getAttribute("loginInfo");
		if(memberCode == null) {
			model.addAttribute("msg", "로그인해야 등록 가능 합니다.");
			model.addAttribute("url", "matchList");
			return "match/alert";
		}
		//팀이 여부 확인
		String teamName = ((MemberVO)session.getAttribute("loginInfo")).getTeamName();
		if(teamName == null) {
			model.addAttribute("msg", "소속팀이 있어야 매치 등록이 가능합니다.");
			model.addAttribute("url", "matchList");
			return "match/alert";
		}
		model.addAttribute("today", CurrentDateTime.today());
		model.addAttribute("time", CurrentDateTime.nowTime());
		model.addAttribute("menuList", menuService.selectMenu());
		model.addAttribute("menuVideo", "video1");
		model.addAttribute("menuName", "매치 신청");
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
	public String matchDetailUpdate(MatchVO matchVO, Model model) {
		matchService.updateDetail(matchVO);
		model.addAttribute("msg", "수정 되었습니다.");
		model.addAttribute("url", "matchList");
		return "match/alert";
	}
	
	//매치 신청하기
	@GetMapping("/updateApplyMatch")
	public String updateApplyMatch(MatchManageVO matchManageVO, HttpSession session, Model model, String memberTell) {
		//로그인 여부 확인
		MemberVO memberCode = (MemberVO)session.getAttribute("loginInfo");
		if(memberCode == null) {
			model.addAttribute("msg", "로그인해야 등록 가능 합니다.");
			model.addAttribute("url", "matchList");
			return "match/alert";
		}
		//팀 여부 확인
		String teamName = ((MemberVO)session.getAttribute("loginInfo")).getTeamName();
		if(teamName == null) {
			model.addAttribute("msg", "소속팀이 있어야 매치 신청이 가능합니다.");
			model.addAttribute("url", "matchList");
			return "match/alert";
		}
		//신청 가능 여부 확인
		boolean result = matchService.checkMatchApply(matchManageVO);
		
		//신청 가능하면 insert
		if(result == true) {
			String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
			matchManageVO.setTeamCodeAway(teamCode);
			matchService.insertApplyMatch(matchManageVO);
			
			//신청시 게시글 등록자(홈팀)에게 문자 전송
			String content = "[FootBall] 매치 신청이 도착했습니다. 홈페이지에서 확인해 주세요";
			MessageService.sendMessage(memberTell, content);
			
			model.addAttribute("msg", "매치 신청이 완료되었습니다.");
			model.addAttribute("url", "matchList");
			return "match/alert";
		}
		//신청 불가능하면 alert
		else if(result == false) {
			model.addAttribute("msg", "이미 신청한 매치 게시글 입니다.");
			model.addAttribute("url", "matchList");
			return "match/alert";
		}
		return "redirect:/match/matchList";
	}
	
	//매치 수락
	@GetMapping("/updateResponse")
	public String updateResponse(MatchManageVO matchManageVO, Model model, String applyMemberTell, String applyTeamName, String writerMemberTell, String writerTeamName, String matchDateAll) {
		matchService.updateResponse(matchManageVO);
		
		//신청시 게시글 등록자(홈팀)에게 문자 전송
		String content = "[FootBall] 매치가 수락되었습니다. 상대팀 : " + applyTeamName + " 매치 날짜 : " + matchDateAll;
		MessageService.sendMessage(writerMemberTell, content);
		System.out.println(writerMemberTell);
		
		//신청시 게시글 신청자(어웨이팀)에게 문자 전송
		String content2 = "[FootBall] 매치가 수락되었습니다. 상대팀 : " + writerTeamName + " 매치 날짜 : " + matchDateAll;
		MessageService.sendMessage2(applyMemberTell, content2);
		System.out.println(applyMemberTell);
		
		model.addAttribute("msg", "매치 수락 하였습니다.");
		model.addAttribute("url", "matchList");
		return "match/alert";
	}
	
	//매치 결과 등록
	@PostMapping("/insertResult")
	public String insertResult(MatchResultVO matchResultVO, Model model) {
		matchService.insertResult(matchResultVO);
		//insertResult 쿼리로 한번에 처리
		//int a = matchService.updateRank(matchVO);
		model.addAttribute("msg", "매치 결과가 등록되었습니다.");
		model.addAttribute("url", "matchList");
		return "match/alert";
	}

	//매치 삭제
	@GetMapping("/deleteMatch")
	public String deleteMatch(String matchCode, Model model) {
		matchService.deleteMatch(matchCode);
		model.addAttribute("msg", "삭제 되었습니다.");
		model.addAttribute("url", "matchList");
		return "match/alert";
	}

}
