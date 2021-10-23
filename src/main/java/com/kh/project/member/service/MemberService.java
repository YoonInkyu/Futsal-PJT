package com.kh.project.member.service;

import java.util.List;

import com.kh.project.member.vo.MemberBlacklistVO;
import com.kh.project.member.vo.MemberImgVO;
import com.kh.project.member.vo.MemberVO;

public interface MemberService {
	//회원가입
	void join (MemberVO memberVO);
	void insertMemberImg(MemberImgVO memberImgVO);
	String nextMemberCode();
	//로그인
	MemberVO login(MemberVO memberVO);
	//마이페이지
	MemberVO myPage(String memberCode);
	//회원블랙리스트 보기
	List<MemberBlacklistVO> memberBlackList (String memberCode);
	//회원블랙 삭제하기
	void deleteMemberBlack(MemberBlacklistVO memberBlacklistVO);
	
}
