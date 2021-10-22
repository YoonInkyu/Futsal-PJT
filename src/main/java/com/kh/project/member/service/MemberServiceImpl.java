package com.kh.project.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.member.vo.MemberBlacklistVO;
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
	
}
