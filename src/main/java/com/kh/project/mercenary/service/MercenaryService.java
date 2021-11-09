package com.kh.project.mercenary.service;

import java.util.List;

import com.kh.project.member.vo.MemberVO;
import com.kh.project.mercenary.vo.MercenaryListVO;
import com.kh.project.mercenary.vo.MercenaryVO;

//윤인규, 1020 작성
// 윤인규 10/23 용병 구인구직 게시글 등록 구현중
public interface MercenaryService {

	//용병 구인 게시글 등록
	public int insertMercBoard(MercenaryVO mercenaryVO);
	
	//용병 구인 게시글 리스트 조회
	public List<MercenaryVO> selectMercBoardList(MercenaryVO mercenaryVO);
	
	//게시글 수 조회
	public int selectMercCnt(MercenaryVO mercenaryVO);
	
	//용병 구인 상세보기
	public MercenaryVO selectMercDetail(String mercBoardCode);
	
	//용병 구인 상세보기 수정
	public int updateMercBoard(MercenaryVO mercenaryVO);
	
	//용병 구인 신청하기
	public int insertMercList(MercenaryVO mercenaryVO);
	
	//용병 신청 리스트 조회
	public List<MercenaryListVO> selectMercRecruitList(MercenaryListVO mercenaryListVO);
	
	//용병 신청자 수락
	public int updateResponse(MercenaryListVO mercenaryListVO);
	
	//나의 용병 게시글 보기
	public List<MercenaryVO> MyMercBoard(String memberCode);
	//나의 용병 신청글 보기
	public List<MercenaryVO> MyRequestMercBoard(String memberCode);
	
	//용병 구인 게시글 삭제
	public int deleteMerc(String mercBoardCode);
	
	//용병 신청 가능 여부 확인
	public boolean checkMercApply(MercenaryListVO mercenaryListVO);
	
}
