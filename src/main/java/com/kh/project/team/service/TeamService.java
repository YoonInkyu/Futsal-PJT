// 10월 20일 송영준



package com.kh.project.team.service;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.project.member.vo.MemberVO;
import com.kh.project.team.vo.TeamApplyVO;
import com.kh.project.team.vo.TeamLogoImgVO;
import com.kh.project.team.vo.TeamMatchVO;
import com.kh.project.team.vo.TeamVO;

public interface TeamService {
	
	//팀 생성
	int insertTeam(TeamVO teamVO);
		
	// 팀코드 생성
	String selectNextTeamCode();
	
	// 팀 로고 등록
	void insertTeamLogoImg(TeamLogoImgVO teamLogoImgVO);
	
	// 팀리스트
	List<TeamVO> selectTeamList(TeamVO teamVO);

	// 팀 상세정보(회원목록 포함)
	List<TeamVO> selectTeamDetail(String teamCode);
	
	// 나의팀 관리
	TeamVO teamManage(String teamCode);
	
	// 팀정보 수정 
	int updateInfo(TeamVO teamVO);
	
	// 팀로고 포함 팀정보 수정
	int updateInfoToImg(TeamVO teamVO);
	
	// 팀 삭제
	int deleteTeam(String teamCode);
	
	// 팀관리 팀원 조회
	List<MemberVO> selectTeamMemberManage(String teamCode);
	
	// 팀관리의 팀원목록 상세조회
	TeamVO selectTeamMemberDetail(String memberCode);
	
	// 팀 가입신청
	void insertTeamApply(TeamApplyVO teamApplyVO);
	
	// 가입신청 멤버리스트
	List<MemberVO> selectApplyMember(String teamCode);
	
	
	// 가입신청 승인
	int teamApplyApproval(TeamVO teamVO);
	
	// 가입신청 거부
	int teamApplyReject(TeamVO teamVO);
	
	// 가입신청 거부
	int teamMemberDelete(TeamVO teamVO);
	
	// 팀이름 중복확인
	boolean checkTeamName(String teamName);
	
	// My팀 매치 경기전 일정 관리
	List<TeamMatchVO> myBeforeMatchManage(String teamCode);
	// My팀 매치 경기 결과 관리
	List<TeamMatchVO> myAfterMatchManage(String teamCode);
	
	// 가입신청 중복확인
	String teamApplyCheck(TeamApplyVO teamApplyVO);
	
	
	//
	
}










