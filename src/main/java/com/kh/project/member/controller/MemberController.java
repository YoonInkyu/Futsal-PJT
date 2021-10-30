//박성환 10/25 : 로그인 조인 경로 변경






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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberBlacklistVO;
import com.kh.project.member.vo.MemberImgVO;
import com.kh.project.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//회원가입 페이지로 이동
	@GetMapping("/goJoin")
	public String goJoin() {
		return  "logPage/member/join";
	}
	//회원가입 하기
	@PostMapping("/join")
	public String join(MemberVO memberVO, MultipartHttpServletRequest multi, Model model) {

		//파일이 첨부되는 input 태그의 name 속성 값 가져오는 객체
		//Iterator<String> inputName = multi.getFileNames();
		
		// 첨부될 폴더 경로 지정
		String uploadPath = "D:\\자바\\workspaceSTS\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Football\\resources\\img\\member\\";
		// join.jsp input파일의 name값 가져옴
		MultipartFile file = multi.getFile("memberImg");
		
		;
		if (!file.getOriginalFilename().equals("")) {
			String memberImgAttachedName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			// 첨부파일 정보가 들어갈 공간
			
			try {
				file.transferTo(new File(uploadPath + memberImgAttachedName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			MemberImgVO memberImgVO = new MemberImgVO();
			memberImgVO.setMemberCode(memberService.nextMemberCode());
			memberImgVO.setMemberImgOrignName(file.getOriginalFilename());
			memberImgVO.setMemberImgAttachedName(memberImgAttachedName);
			memberService.join(memberVO);
			memberService.insertMemberImg(memberImgVO);
		}
		else {
			memberService.join(memberVO);
		}
		
		return  "member/join_result";
	}
	//id 중복 체크
	@ResponseBody
	@PostMapping("/checkId")
	public boolean checkId(String memberId) {
		//기존 가입 : true, 미가입 : false
		return memberService.checkId(memberId);
	}
	//비밀번호 체크
	@ResponseBody
	@PostMapping("/checkPw")
	public boolean checkPw(String memberPw, String memberCode) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberPw(memberPw);
		memberVO.setMemberCode(memberCode);
		//일치 : true, 불일치 : false
		return  memberService.checkPw(memberVO);
	}
	@ResponseBody
	@PostMapping("/changePw")
	public boolean changePw(MemberVO memberVO) {
		return memberService.changePw(memberVO);
	}
	@ResponseBody
	@PostMapping("/checkLogin")
	public boolean checkLogin(String memberId, String memberPw) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberId(memberId);
		memberVO.setMemberPw(memberPw);
		boolean result = memberService.checkLogin(memberVO);
		return result;
	}

	//로그인 하기
	@PostMapping("/login")
	public String login(MemberVO memberVO, HttpSession session) {
		session.setAttribute("loginInfo", memberService.selectMemberInfo(memberService.login(memberVO)));
		return  "mainPage/main_page";
	}
	//로그아웃 하기
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return  "mainPage/main_page";
	}
	//마이페이지 가기
	@GetMapping("/myPage")
	public String mypage(HttpSession session, Model model) {
		String memberCode = ((MemberVO)session.getAttribute("loginInfo")).getMemberCode();
		model.addAttribute("member",memberService.myPage(memberCode));
		return  "member/my_page";
	}
	//회원정보 수정페이지 가기
	@GetMapping("/goUpdateMember")
	public String goUpdateMember(HttpSession session, Model model) {
		String memberCode = ((MemberVO)session.getAttribute("loginInfo")).getMemberCode();
		MemberVO memberVO = new MemberVO(); 
		memberVO = memberService.myPage(memberCode);
		
		String memberTell = memberVO.getMemberTell();
		String[] updateTells = memberTell.split("-");
		
		memberVO.setUpdateTells(updateTells);
		model.addAttribute("member",memberVO);
		return  "member/update_member_info";
	}
	//회원정보 수정하기
	@PostMapping("/updateMemberInfo")
	public String UpdateMember(MemberVO memberVO, MultipartHttpServletRequest multi, Model model, HttpSession session) {
		memberService.updateMemberInfo(memberVO);
		// 첨부될 폴더 경로 지정
		String uploadPath = "D:\\자바\\workspaceSTS\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Football\\resources\\img\\member\\";
		
		// join.jsp input파일의 name값 가져옴
		MultipartFile file = multi.getFile("memberImg");
		if (!file.getOriginalFilename().equals("")) {
			String memberImgAttachedName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			// 첨부파일 정보가 들어갈 공간
			
			try {
				file.transferTo(new File(uploadPath + memberImgAttachedName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			MemberImgVO memberImgVO = new MemberImgVO();
			memberImgVO.setMemberCode(memberVO.getMemberCode());
			memberImgVO.setMemberImgOrignName(file.getOriginalFilename());
			memberImgVO.setMemberImgAttachedName(memberImgAttachedName);
			if(memberService.checkMemberImg(memberVO.getMemberCode())) {
				memberService.insertMemberImg(memberImgVO);
			}
			else {
				memberService.updateMemberImg(memberImgVO);
			}
		}
		session.setAttribute("loginInfo", memberService.selectMemberInfo(memberVO.getMemberCode()));
		return  "redirect:/member/myPage";
	}
	//멤버 블랙리스트 관리페이지
	@GetMapping("/goMemberBlacklist")
	public String goMemberBlacklist(HttpSession session, Model model) {
		String memberCode = ((MemberVO)session.getAttribute("loginInfo")).getMemberCode();
		model.addAttribute("black",memberService.memberBlackList(memberCode));
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









