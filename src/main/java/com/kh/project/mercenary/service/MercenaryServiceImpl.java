package com.kh.project.mercenary.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.member.vo.MemberVO;
import com.kh.project.mercenary.vo.MercenaryVO;

//윤인규, 1020 작성
//윤인규 10/23 용병 구인구직 게시글 등록 구현중
@Service("mercenaryService")
public class MercenaryServiceImpl implements MercenaryService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//로그인 정보 가져오기
	@Override
	public MemberVO selectLoginInfo(String memberCode) {
		return sqlSession.selectOne("mercenaryMapper.selectLoginInfo", memberCode);
	}
	
	//용병 구인 게시글 등록
	@Override
	public int insertMercRecruit(MercenaryVO mercenaryVO) {
		return sqlSession.insert("mercenaryMapper.insertMercRecruit", mercenaryVO);
	}
	
	//용병 구인 게시글 리스트 조회
	@Override
	public List<MercenaryVO> selectMercBoardList() {
		return sqlSession.selectList("mercenaryMapper.selectMercBoardList");
	}
	
	//용병 구인 상세보기
	@Override
	public MercenaryVO selectMercDetail(String mercenaryBoardCode) {
		return sqlSession.selectOne("mercenaryMapper.selectMercDetail", mercenaryBoardCode);
	}

	//용병 구직 게시글 등록
	@Override
	public int insertMercApply(MercenaryVO mercenaryVO) {
		return sqlSession.insert("mercenaryMapper.insertMercApply", mercenaryVO);
	}

	//용병 구직 게시글 리스트 조회
	@Override
	public List<MercenaryVO> selectMercApplyList() {
		return sqlSession.selectList("mercenaryMapper.selectMercApplyList");
	}
	
	//용병 구직 상세보기
	@Override
	public MercenaryVO selectMercApplyDetail(String mercenaryApplyCode) {
		return sqlSession.selectOne("mercenaryMapper.selectMercApplyDetail", mercenaryApplyCode);
	}

	

	

	
	
}
