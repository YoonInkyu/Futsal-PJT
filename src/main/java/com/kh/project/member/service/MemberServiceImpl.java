package com.kh.project.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.member.vo.MemberBlacklistVO;
import com.kh.project.member.vo.MemberImgVO;
import com.kh.project.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int join(MemberVO memberVO) {
		return sqlSession.insert("memberMapper.join", memberVO);
		
	}
	@Override
	public boolean checkId(String memberId) {
		String result = sqlSession.selectOne("memberMapper.checkId", memberId);
		return result == null ? false : true;
	}
	
	@Override
	public void insertMemberImg(MemberImgVO memberImgVO) {
		sqlSession.insert("memberMapper.insertMemberImg", memberImgVO);
		
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.login", memberVO);
	}

	@Override
	public MemberVO myPage(String memberCode) {
		return sqlSession.selectOne("memberMapper.selectMemberInfo", memberCode);
	}
	
	@Override
	public List<MemberBlacklistVO> memberBlackList(String memberCode) {
		return sqlSession.selectList("memberMapper.memberBlackList", memberCode);
	}

	@Override
	public void deleteMemberBlack(MemberBlacklistVO memberBlacklistVO) {
		sqlSession.delete("memberMapper.deleteMemberBlack", memberBlacklistVO);
		
	}

	@Override
	public String nextMemberCode() {
		return sqlSession.selectOne("memberMapper.nextMemberCode");
	}
	@Override
	public void updateMemberInfo(MemberVO memberVO) {
		sqlSession.update("memberMapper.updateMemberInfo", memberVO);
		
	}
	@Override
	public void updateMemberImg(MemberImgVO memberImgVO) {
		sqlSession.update("memberMapper.udateMemberImg", memberImgVO);
		
	}
	@Override
	public String checkMemberImg(String memberCode) {
		return sqlSession.selectOne("memberMapper.checkMemberImg", memberCode);
	}


	
}
