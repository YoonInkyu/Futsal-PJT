package com.kh.project.match.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.match.vo.MatchManageVO;
import com.kh.project.match.vo.MatchVO;

//윤인규, 1028 매치 구현중
@Service("matchService")
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//매치 게시글 등록
	@Override
	public int insertMatchBoard(MatchVO matchVO) {
		return sqlSession.insert("matchMapper.insertMatchBoard", matchVO);
	}

	//매치 게시글 조회
	@Override
	public List<MatchVO> selectMatchList() {
		return sqlSession.selectList("matchMapper.selectMatchList");
	}
	
	//매치 상세보기
	@Override
	public MatchVO selectMatchDetail(String matchCode) {
		return sqlSession.selectOne("matchMapper.selectMatchDetail", matchCode);
	}

	//매치 신청하기
	@Override
	public int insertApplyMatch(MatchManageVO matchManageVO) {
		sqlSession.insert("matchMapper.insertApplyMatch", matchManageVO);
		return sqlSession.update("matchMapper.updateTeamCnt", matchManageVO);
	}

	//매치 신청팀 보기
	@Override
	public List<MatchManageVO> matchApplyList(String matchCode) {
		return sqlSession.selectList("matchMapper.matchApplyList", matchCode);
	}
	
	
	
}
