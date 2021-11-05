package com.kh.project.member.service;

import java.util.List;

import com.kh.project.member.vo.MemberBlacklistVO;
import com.kh.project.member.vo.MemberImgVO;
import com.kh.project.member.vo.MemberVO;

public interface MemberService {
	//회원가입
	void join (MemberVO memberVO);
	//아이디 중복체크
	boolean checkId (String memberId);
	//비밀번호 확인
	boolean checkPw (MemberVO memberVO);
	//비밀번호 변경
	boolean changePw(MemberVO memberVO);
	//회원이미지 인설트
	void insertMemberImg(MemberImgVO memberImgVO);
	//다음 회원코드 조회
	String nextMemberCode();
	//아이디 비밀번호 확인
	boolean checkLogin(MemberVO memberVO);
	//로그인
	String login(MemberVO memberVO);
	//세션정보
	MemberVO selectMemberInfo(String memberCode);
	//마이페이지
	MemberVO myPage(String memberCode);
	//회원이미지유무 확인
	boolean checkMemberImg(String memberCode);
	//회원정보 수정하기
	void updateMemberInfo(MemberVO memberVO);
	//회원이미지 수정하기
	void updateMemberImg(MemberImgVO memberImgVO);
	//회원아이디에서 회원코드 빼오기
	String memberCode(String memberId);
	//블랙중복확인
	boolean checkMemberBlack(MemberBlacklistVO memberBlacklistVO);
	//회원 블랙하기
	boolean addMemberBlack(MemberBlacklistVO memberBlacklistVO);
	//회원블랙리스트 보기
	List<MemberBlacklistVO> memberBlackList (String memberCode);
	//회원블랙 삭제하기
	void deleteMemberBlack(MemberBlacklistVO memberBlacklistVO);
	//회원탈퇴
	void deleteMember(String memberCode);
}
