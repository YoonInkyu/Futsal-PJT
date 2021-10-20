package com.kh.project.team.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.team.service.TeamService;
import com.kh.project.team.vo.TeamVO;

@Controller
@RequestMapping("/team")
public class TeamController {
	@Resource(name = "teamService")
	private TeamService teamService;
	
	// 팀 생성
	@PostMapping("/regTeam")
	public String regTeam(TeamVO teamVO) {
		
		// 팀코드 조회
		String selectTeamCode = teamService.selectNextTeamCode();
		
		// 팀코드 VO에 입력
		TeamVO teamCode = new TeamVO();
		teamCode.setTeamCode(selectTeamCode);
		
		// 팀로고 등록
		
		
		// 회원정보 가져오기(회원코드 필요)
		
		
		// 팀 생성 정보 insert
		teamService.insertTeam(teamVO);
		
		
		
		return "";
	}
	
}
