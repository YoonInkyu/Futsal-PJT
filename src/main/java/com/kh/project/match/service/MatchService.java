package com.kh.project.match.service;

import java.util.List;

import com.kh.project.match.vo.MatchManageVO;
import com.kh.project.match.vo.MatchResultVO;
import com.kh.project.match.vo.MatchVO;

public interface MatchService {
	
	//매치 게시글 등록
	public int insertMatchBoard(MatchVO matchVO);
	
	//매치 게시글 조회
	public List<MatchVO> selectMatchList();
	
	//매치 상세보기
	public MatchVO selectMatchDetail(String matchCode);
	
	//매치 신청하기
	public int insertApplyMatch(MatchManageVO matchManageVO);
	
	//매치 신청팀 리스트 보기
	public List<MatchManageVO> matchApplyList(String matchCode);
	
	//매치 수정
	public int updateDetail(MatchVO matchVO);
	
	//매치 수락
	public int updateResponse(MatchManageVO matchManageVO);
	
	//매치 결과 입력
	public int insertResult(MatchResultVO matchResultVO);
	
	//매치 결과 조회
	public MatchResultVO selectResult(String matchCode);
}
