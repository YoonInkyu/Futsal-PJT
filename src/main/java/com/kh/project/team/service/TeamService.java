// 10월 20일 송영준



package com.kh.project.team.service;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.project.team.vo.TeamLogoImgVO;
import com.kh.project.team.vo.TeamVO;

public interface TeamService {
	
	//팀 생성
	int insertTeam(TeamVO teamVO);
		
	// 팀코드 생성
	String selectNextTeamCode();
	
	// 팀 로고 등록
	void insertTeamLogoImg(TeamLogoImgVO teamLogoImgVO);
	
	// 팀리스트
	List<TeamVO> selectTeamList();
	
	
}
