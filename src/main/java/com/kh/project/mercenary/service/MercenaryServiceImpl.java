package com.kh.project.mercenary.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.member.vo.MemberVO;
import com.kh.project.mercenary.vo.MercenaryListVO;
import com.kh.project.mercenary.vo.MercenaryVO;

//윤인규, 1020 작성
//윤인규, 10/23 용병 구인구직 게시글 등록 구현중
//윤인규, 10/27 용병 지원 수락 구현중
@Service("mercenaryService")
public class MercenaryServiceImpl implements MercenaryService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//용병 구인구직 게시글 등록
	@Override
	public int insertMercBoard(MercenaryVO mercenaryVO) {
		return sqlSession.insert("mercenaryMapper.insertMercBoard", mercenaryVO);
	}
	
	//용병 구인구직 게시글 리스트 조회
	@Override
	public List<MercenaryVO> selectMercBoardList() {
		return sqlSession.selectList("mercenaryMapper.selectMercBoardList");
	}
	
	//용병 구인구직 상세보기
	@Override
	public MercenaryVO selectMercDetail(String mercBoardCode) {
		return sqlSession.selectOne("mercenaryMapper.selectMercDetail", mercBoardCode);
	}

	//용병 구인구직 신청하기
	@Override
	public int insertMercList(MercenaryVO mercenaryVO) {
		sqlSession.update("mercenaryMapper.updateMemberCnt", mercenaryVO);
		return sqlSession.insert("mercenaryMapper.insertMercList", mercenaryVO);
	}

	//용병 구인구직 신청자 리스트 조회
	@Override
	public List<MercenaryListVO> selectMercRecruitList(MercenaryListVO mercenaryListVO) {
		return sqlSession.selectList("mercenaryMapper.selectMercRecruitList", mercenaryListVO);
	}
	
	//용병 구인구직 신청 수락
	@Override
	public int updateResponse(MercenaryListVO mercenaryListVO) {
		//수락 업데이트
		sqlSession.update("mercenaryMapper.updateResponse", mercenaryListVO);
		//수락한 애 제외 모두 거절로 업데이트
		sqlSession.update("mercenaryMapper.updateRespnseRefuse", mercenaryListVO);
		//해당 게시글 지원 불가로 업데이트
		return sqlSession.update("mercenaryMapper.updatePossible", mercenaryListVO);
	}

	
}
