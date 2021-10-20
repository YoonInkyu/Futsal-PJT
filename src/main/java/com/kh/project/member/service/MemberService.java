package com.kh.project.member.service;

import com.kh.project.member.vo.MemberVO;

public interface MemberService {
	//회원가입
	void join (MemberVO memberVO);
	//로그인
	MemberVO login(MemberVO memberVO);
}
