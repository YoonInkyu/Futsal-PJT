package com.kh.project.mercenary.service;

import java.util.List;

import com.kh.project.member.vo.MemberVO;
import com.kh.project.mercenary.vo.MercenaryVO;

//윤인규, 1020 작성
// 윤인규 10/23 용병 구인구직 게시글 등록 구현중
public interface MercenaryService {
	//로그인 정보 가져오기
	public MemberVO selectLoginInfo(String memberCode);
	
	//용병 구인 게시글 등록
	public int insertMercRecruit(MercenaryVO mercenaryVO);
	
	//용병 구인 게시글 리스트 조회
	public List<MercenaryVO> selectMercBoardList();
	
	//용병 구인 상세보기
	public MercenaryVO selectMercDetail(String mercenaryBoardCode);

	//용병 구직 게시글 등록
	public int insertMercApply(MercenaryVO mercenaryVO);
	
	//용병 구직 게시글 리스트 조회
	public List<MercenaryVO> selectMercApplyList();
	
}
