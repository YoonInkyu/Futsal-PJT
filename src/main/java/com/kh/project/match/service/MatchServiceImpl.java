package com.kh.project.match.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.match.vo.MatchManageVO;
import com.kh.project.match.vo.MatchResultVO;
import com.kh.project.match.vo.MatchVO;

//윤인규, 1028 매치 구현중
//윤인규, 1030 매치 매칭 및 결과입력 구현중
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

	//매치 수정
	@Override
	public int updateDetail(MatchVO matchVO) {
		return sqlSession.update("matchMapper.updateDetail", matchVO);
	}
	
	//매치 수락
	@Override
	public int updateResponse(MatchManageVO matchManageVO) {
		//수락 업데이트
		sqlSession.update("matchMapper.updateResponse", matchManageVO);
		//거절 업데이트
		sqlSession.update("matchMapper.updateResponseRefuse", matchManageVO);
		//해당 게시글 지원불가
		return sqlSession.update("matchMapper.updatePossible", matchManageVO);
	}

	//매치 결과 입력
	@Override
	public int insertResult(MatchResultVO matchResultVO) {
		return sqlSession.insert("matchMapper.insertResult", matchResultVO);
	}

	//매치 결과 조회
	@Override
	public MatchResultVO selectResult(String matchCode) {
		return sqlSession.selectOne("matchMapper.selectResult", matchCode);
	}

	
	
	
}
