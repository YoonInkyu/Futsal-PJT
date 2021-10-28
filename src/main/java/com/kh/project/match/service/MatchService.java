package com.kh.project.match.service;

import java.util.List;

import com.kh.project.match.vo.MatchVO;

public interface MatchService {
	
	//매치 게시글 등록
	public int insertMatchBoard(MatchVO matchVO);
	
	//매치 게시글 조회
	public List<MatchVO> selectMatchList();
}
