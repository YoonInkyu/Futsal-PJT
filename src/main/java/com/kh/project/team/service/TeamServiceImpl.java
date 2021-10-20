package com.kh.project.team.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.team.vo.TeamVO;


@Service("teamService")
public class TeamServiceImpl implements TeamService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 팀생성
	@Override
	public int insertTeam(TeamVO teamVO) {
		return sqlSession.insert("teamMapper.insertTeam", teamVO);
	}

	// 팀코드 생성
	@Override
	public String selectNextTeamCode() {
		return sqlSession.selectOne("teamMapper.selectNextTeamCode");
	}
	
	// 팀생성시 팀로고 업로드
	@Override
	public void insertTeamLogoImg(TeamVO teamVO) {
		sqlSession.insert("teamMapper.insertTeamLogoImg", teamVO);
	}

	
	
}
