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
	public void join(MemberVO memberVO) {
		sqlSession.insert("memberMapper.join", memberVO);
		
	}
	@Override
	public boolean checkId(String memberId) {
		String result = sqlSession.selectOne("memberMapper.checkId", memberId);
		return result == null ? false : true;
	}
	@Override
	public boolean checkPw(MemberVO memberVO) {
		String result = sqlSession.selectOne("memberMapper.checkPw", memberVO);
		return result == null ? false : true;
	}
	
	@Override
	public boolean changePw(MemberVO memberVO) {
		int result = sqlSession.update("memberMapper.changePw", memberVO);
		return result == 0 ? false : true;
	}
	@Override
	public void insertMemberImg(MemberImgVO memberImgVO) {
		sqlSession.insert("memberMapper.insertMemberImg", memberImgVO);
		
	}

	@Override
	public boolean checkLogin(MemberVO memberVO) {
		String result = sqlSession.selectOne("memberMapper.checkLogin", memberVO);
		return result == null ? false : true;
	}
	@Override
	public String login(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.checkLogin", memberVO);
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
		sqlSession.update("memberMapper.updateMemberImg", memberImgVO);
		
	}
	@Override
	public boolean checkMemberImg(String memberCode) {
		return sqlSession.selectOne("memberMapper.checkMemberImg", memberCode) == null ? true : false;
	}
	@Override
	public MemberVO selectMemberInfo(String memberCode) {
		return sqlSession.selectOne("memberMapper.selectMemberInfo", memberCode);
	}
	@Override
	public String memberCode(String memberId) {
		return sqlSession.selectOne("memberMapper.memberCode", memberId);
	}
	@Override
	public boolean checkMemberBlack(MemberBlacklistVO memberBlacklistVO) {
		return sqlSession.selectOne("memberMapper.checkMemberBlack", memberBlacklistVO) == null ? true : false;
	}
	@Override
	public boolean addMemberBlack(MemberBlacklistVO memberBlacklistVO) {
		return sqlSession.insert("memberMapper.addMemberBlack", memberBlacklistVO) == 0 ? false : true;
	}
	@Override
	public void deleteMember(String memberCode) {
		sqlSession.delete("memberMapper.deleteMember", memberCode);
		
	}


	
}
