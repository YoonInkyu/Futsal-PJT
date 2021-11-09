// 10월 20일 송영준



package com.kh.project.team.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.project.member.vo.MemberVO;
import com.kh.project.team.vo.TeamApplyVO;
import com.kh.project.team.vo.TeamLogoImgVO;
import com.kh.project.team.vo.TeamMatchVO;
import com.kh.project.team.vo.TeamVO;


@Service("teamService")
public class TeamServiceImpl implements TeamService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 팀생성
	@Override
	public int insertTeam(TeamVO teamVO) {
		sqlSession.update("teamMapper.upDateMemberTeamCode", teamVO);
		sqlSession.insert("teamMapper.insertTeam", teamVO);
		return sqlSession.insert("teamMapper.insertRankTeam", teamVO); 
	}

	// 팀코드 생성
	@Override
	public String selectNextTeamCode() {
		
		return sqlSession.selectOne("teamMapper.selectNextTeamCode");
	}
	
	// 팀생성시 팀로고 업로드
	@Override
	public void insertTeamLogoImg(TeamLogoImgVO teamLogoImgVO) {
		sqlSession.insert("teamMapper.insertTeamLogoImg", teamLogoImgVO);
	}
	
	// 팀리스트 조회
	@Override
	public List<TeamVO> selectTeamList(TeamVO teamVO) {
		return sqlSession.selectList("teamMapper.selectTeamList", teamVO);
	}
	// 나의팀 조회
	@Override
	public TeamVO teamManage(String teamCode) {
		return sqlSession.selectOne("teamMapper.selectTeamManage", teamCode);
	}
	// 팀정보 수정
	@Override
	public int updateInfo(TeamVO teamVO) {
		return sqlSession.update("teamMapper.updateInfo", teamVO);
	}
	public int updateInfoToImg(TeamVO teamVO) {
		sqlSession.update("teamMapper.updateInfo", teamVO);
		return sqlSession.update("teamMapper.updateImgInfo", teamVO);
	}
	// 팀삭제
	@Override
	public int deleteTeam(String teamCode) {
		sqlSession.update("teamMapper.deleteTeamImg", teamCode);
		sqlSession.delete("teamMapper.deleteTeam", teamCode);
		return sqlSession.update("teamMapper.deleteMemberTeamCode", teamCode);
		
	}

	// 팀 상세정보(회원목록 포함)
	@Override
	public List<TeamVO> selectTeamDetail(String teamCode) {
		return sqlSession.selectList("teamMapper.selectTeamDetail", teamCode);
	}
	
	// 팀 관리의 팀원목록 조회
	@Override
	public List<MemberVO> selectTeamMemberManage(String teamCode) {
		
		// 팀 멤버 조회
		return sqlSession.selectList("teamMapper.selectTeamMemberManage", teamCode);
	}

	// 팀관리의 팀원목록 상세조회
	@Override
	public TeamVO selectTeamMemberDetail(String memberCode) {
		return sqlSession.selectOne("teamMapper.selectTeamMemberDetail", memberCode);
	}
	
	// 팀 가입신청
	@Override
	public void insertTeamApply(TeamApplyVO teamApplyVO) {
		sqlSession.insert("teamMapper.insertTeamApply", teamApplyVO);
		
	}

	// 가입신청 멤버 리스트
	@Override
	public List<MemberVO> selectApplyMember(String teamCode) {
		return sqlSession.selectList("teamMapper.selectApplyMember", teamCode);

	}
	// 팀가입 승인
	@Override
	public int teamApplyApproval(TeamVO teamVO) {
		sqlSession.update("teamMapper.teamApplyApproval", teamVO);
		return sqlSession.delete("teamMapper.teamApplyReject", teamVO);
	}
	
	// 팀가입 거부
	@Override
	public int teamApplyReject(TeamVO teamVO) {
		return sqlSession.delete("teamMapper.teamApplyReject", teamVO);
	}
	
	// 팀원 강퇴
	@Override
	public int teamMemberDelete(TeamVO teamVO) {
		return sqlSession.update("teamMapper.teamMemberDelete", teamVO);
	}
	
	// 팀이름 중복확인
	@Override
	public boolean checkTeamName(String teamName) {
		String result = sqlSession.selectOne("teamMapper.checkTeamName", teamName);
		return result == null ? true : false;
	}
	
	// My팀 매치 경기전 일정
	@Override
	public List<TeamMatchVO> myBeforeMatchManage(String teamCode) {
		return sqlSession.selectList("teamMapper.myBeforeMatchManage", teamCode);
	}
	// My팀 매치 경기 후 결과
	@Override
	public List<TeamMatchVO> myAfterMatchManage(String teamCode) {
		return sqlSession.selectList("teamMapper.myAfterMatchManage", teamCode);
	}

	@Override
	public String teamApplyCheck(TeamApplyVO teamApplyVO) {
		return sqlSession.selectOne("teamMapper.teamApplyCheck", teamApplyVO);
	}

	//팀 리스트 데이터 개수 조회
	@Override
	public int selectTeamCnt(TeamVO teamVO) {
		return sqlSession.selectOne("teamMapper.selectTeamCnt", teamVO);
	}


	
	

	
	
}
