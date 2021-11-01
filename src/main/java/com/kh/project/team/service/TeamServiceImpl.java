// 10월 20일 송영준



package com.kh.project.team.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.project.member.vo.MemberVO;
import com.kh.project.team.vo.TeamLogoImgVO;
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

	
	
}
