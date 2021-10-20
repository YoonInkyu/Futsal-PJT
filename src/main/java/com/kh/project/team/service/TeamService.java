package com.kh.project.team.service;

import com.kh.project.team.vo.TeamVO;

public interface TeamService {
	
	//팀 생성
	int insertTeam(TeamVO teamVO);
		
	// 팀코드 생성
	String selectNextTeamCode();
	
	// 팀 로고 등록
	void insertTeamLogoImg(TeamVO teamVO);
	
	
	
	
}
