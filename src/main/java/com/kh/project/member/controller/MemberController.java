package com.kh.project.member.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberBlacklistVO;
import com.kh.project.member.vo.MemberImgVO;
import com.kh.project.member.vo.MemberVO;
import com.kh.project.team.vo.TeamLogoImgVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//회원가입 페이지로 이동
	@GetMapping("/goJoin")
	public String goJoin() {
		return  "templateLayout/member/join";
	}
	//회원가입 하기
	@PostMapping("/join")
	public String join(MemberVO memberVO, MultipartHttpServletRequest multi) {

		//파일이 첨부되는 input 태그의 name 속성 값 가져오는 객체
		//Iterator<String> inputName = multi.getFileNames();
		
		// 첨부될 폴더 경로 지정
		String uploadPath = "C:\\Users\\PC\\git\\ProjectTest\\src\\main\\webapp\\resources\\img\\member\\";
		
		// regTeam.jsp input파일의 name값 가져옴
		MultipartFile file = multi.getFile("memberImg");
		String memberImgAttachedName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		
		try {
			file.transferTo(new File(uploadPath + memberImgAttachedName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 첨부파일 정보가 들어갈 공간
		MemberImgVO memberImgVO = new MemberImgVO();
		memberImgVO.setMemberCode(memberService.nextMemberCode());
		memberImgVO.setMemberImgOrignName(file.getOriginalFilename());
		memberImgVO.setMemberImgAttachedName(memberImgAttachedName);
		
		memberService.join(memberVO);
		if (file != null) {
			memberService.insertMemberImg(memberImgVO);
		}
		
		return  "redirect:/member/goLogin";
	}
	//로그인 페이지로 이동
	@GetMapping("/goLogin")
	public String goLogin() {
		return  "templateLayout/member/login";
	}
	//로그인 하기
	@PostMapping("/goLogin")
	public String Login(MemberVO memberVO, HttpSession session) {
		MemberVO loginInfo = memberService.login(memberVO);
		session.setAttribute("loginInfo", loginInfo);
		return  "templateLayout/main_page";
	}
	//로그아웃 하기
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return  "templateLayout/main_page";
	}
	//마이페이지 가기
	@GetMapping("/myPage")
	public String mypage(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("member",memberService.myPage(memberVO.getMemberCode()));
		return  "member/my_page";
	}
	//마이페이지 가기
	@GetMapping("/goUpdateMember")
	public String correctionMemberInfo(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("member",memberService.myPage(memberVO.getMemberCode()));
		return  "member/update_member_info";
	}
	//멤버 블랙리스트 관리페이지
	@GetMapping("/goMemberBlacklist")
	public String goMemberBlacklist(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("black",memberService.memberBlackList(memberVO.getMemberCode()));
		return  "member/member_blacklist";
	}
	//멤버블랙 삭제하기
	@GetMapping("/deleteMemberBlack")
	public String deleteMemberBlack(HttpSession session, Model model, String blackmemberCode) {
		String memberCode = ((MemberVO)session.getAttribute("loginInfo")).getMemberCode();
		MemberBlacklistVO memberBlacklistVO = new MemberBlacklistVO();
		memberBlacklistVO.setMemberCode(memberCode);
		memberBlacklistVO.setBlackmemberCode(blackmemberCode);
		
		memberService.deleteMemberBlack(memberBlacklistVO);
		return  "redirect:/member/goMemberBlacklist";
	}
}









