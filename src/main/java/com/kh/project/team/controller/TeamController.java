// 10월 20일 송영준

package com.kh.project.team.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

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
import com.kh.project.member.vo.MemberVO;
import com.kh.project.menu.service.MenuService;
import com.kh.project.team.service.TeamService;
import com.kh.project.team.vo.TeamApplyVO;
import com.kh.project.team.vo.TeamLogoImgVO;
import com.kh.project.team.vo.TeamVO;

@Controller
@RequestMapping("/team")
public class TeamController {
	@Resource(name = "teamService")
	private TeamService teamService;
	@Resource(name = "memberService")
	private MemberService memberService;
	@Resource(name = "menuService")
	private MenuService menuService;
	
	
	// 팀생성 페이지로 이동
	@GetMapping("/goRegTeam")
	public String goRegTeam(HttpSession session, Model model, String menuVideo, String menuName) {
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		if(teamCode == null) {
			model.addAttribute("menuList", menuService.selectMenu());
			model.addAttribute("menuVideo", "video4");
			model.addAttribute("menuName", "팀 생성");
			return "team/submenu_team_create";
		}
		else {
			model.addAttribute("msg", "이미 팀이있습니다.");
			model.addAttribute("url", "selectTeamList");

			return "team/alert"; 
		}
			
	} 
	// 팀삭제 페이지로 이동
	@GetMapping("/goTeamDelete")
	public String goTeamDelete() {
		return "team/team_delete";
	} 
	
	// My 팀 페이지 이동
	@GetMapping("/submenuTeamManage") 
	public String teamManage_admin() {

	return "myTeamLayout/team/submenu_team_manage";
			
	}
	
	//나의팀 -> (서브메뉴)팀정보 페이지 이동
	@GetMapping("/teamInfo")
	public String teamInfo(HttpSession session, Model model, String menuVideo, String menuName) {
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		if(teamCode == null) {
			model.addAttribute("msg", "팀 가입후 이용가능합니다.");
			model.addAttribute("url", "selectTeamList");
			return "team/alert";
		}
		model.addAttribute("myTeam", teamService.teamManage(teamCode));
		model.addAttribute("menuList", menuService.selectMenu());
		model.addAttribute("menuVideo", "video3");
		model.addAttribute("menuName", "나의 팀");
		return "myTeamLayout/team/team_info";
	} 
	
	//나의팀 -> 팀정보 -> 팀 정보 수정 아약스
	@ResponseBody
	@PostMapping("/changeInfo")
	public TeamVO changeInfo(HttpSession session, Model model) {
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		return teamService.teamManage(teamCode);
	} 
	
	// 나의팀->팀관리 -> 팀정보 수정
	@PostMapping("/updateInfo") 
	public String updateInfo(TeamVO teamVO, HttpSession session, MultipartHttpServletRequest multi) { 
		// 첨부될 폴더 경로 지정
		String uploadPath = "C:\\Users\\kh202-30\\git\\ProjectTest\\src\\main\\webapp\\resources\\img\\team\\";
		//String uploadPath = "C:\\Users\\User\\git\\ProjectTest\\src\\main\\webapp\\resources\\img\\team\\";
		
		// regTeam.jsp input파일의 name값 가져옴
		MultipartFile file = multi.getFile("teamLogo");
		String teamLogoImgAttachedName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		
		try {
			file.transferTo(new File(uploadPath + teamLogoImgAttachedName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 로그인 회원의 팀코드 가지고옴
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		// 가지고온 팀코드를 teamVO에 업로드
		teamVO.setTeamCode(teamCode);
		// 수정된 이미지파일 teamVO에 업로드
		teamVO.setTeamLogoImgAttachedName(teamLogoImgAttachedName);
		teamVO.setTeamLogoImgOrignName(file.getOriginalFilename());
		
		// 업데이트 실행
		teamService.updateInfo(teamVO);
		
		return "redirect:/team/teamInfo";
	}
	
	// 팀 삭제
		@GetMapping("/deleteTeam")
		public String teamDelete(HttpSession session, String menuVideo) {
			String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
			teamService.deleteTeam(teamCode);
			session.setAttribute("loginInfo", memberService.selectMemberInfo(((MemberVO)session.getAttribute("loginInfo")).getMemberCode()));
			return "redirect:/team/selectTeamList";
		}
	
		
	
	
	// 팀 생성
	@PostMapping("/regTeam")
	public String regTeam(TeamVO teamVO, MultipartHttpServletRequest multi, HttpSession session) {
		
		//파일이 첨부되는 input 태그의 name 속성 값 가져오는 객체
		//Iterator<String> inputName = multi.getFileNames();
		
		// 첨부될 폴더 경로 지정
		String uploadPath = "C:\\Users\\kh202-30\\git\\ProjectTest\\src\\main\\webapp\\resources\\img\\team\\";
		//String uploadPath = "C:\\Users\\User\\git\\ProjectTest\\src\\main\\webapp\\resources\\img\\team\\";
		
		// regTeam.jsp input파일의 name값 가져옴
		MultipartFile file = multi.getFile("teamLogo");
		String teamLogoImgAttachedName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		
		try {
			file.transferTo(new File(uploadPath + teamLogoImgAttachedName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 팀코드 조회
		String selectTeamCode = teamService.selectNextTeamCode();
		
		// 첨부파일 정보가 들어갈 공간
		TeamLogoImgVO teamLogoImg = new TeamLogoImgVO();
		teamLogoImg.setTeamCode(selectTeamCode);
		teamLogoImg.setTeamLogoImgOrignName(file.getOriginalFilename());
		teamLogoImg.setTeamLogoImgAttachedName(teamLogoImgAttachedName);
		
		// 팀코드 VO에 입력
		teamVO.setTeamCode(selectTeamCode);
		
		// 회원정보 가져와서 VO에 SET (윤인규,10/22 수정)
		MemberVO memberInfo = (MemberVO)session.getAttribute("loginInfo");
		teamVO.setMemberCode(memberInfo.getMemberCode());
		
		// 팀 생성 정보 insert
		teamService.insertTeam(teamVO);
		// 팀로고 등록
		teamService.insertTeamLogoImg(teamLogoImg);
		
		session.setAttribute("loginInfo", memberService.selectMemberInfo(memberInfo.getMemberCode()));
		
		
		
		return "redirect:/templateLayout/main_page";
	}
	
	// 팀 리스트 조회 
	@GetMapping("/selectTeamList")
	public String selectTeamList(Model model, TeamVO teamVO, String menuVideo, String menuName) {
		model.addAttribute("teamList", teamService.selectTeamList(teamVO)); 
		model.addAttribute("menuList", menuService.selectMenu());
		model.addAttribute("menuVideo", "video5");
		model.addAttribute("menuName", "팀 목록");
		return "team/submenu_team_list";
	}
	// 팀 리스트 조회 -> 상세보기
	@GetMapping("/teamDetail")
	public String teamDetail(String teamCode, Model model, HttpSession session, String menuVideo, String menuName) {
		String memberCode = ((MemberVO)session.getAttribute("loginInfo")).getMemberCode();
		model.addAttribute("teamDetail", teamService.selectTeamDetail(teamCode));
		model.addAttribute("teamCode", teamCode);
		model.addAttribute("memberCode", memberCode);
		model.addAttribute("menuList", menuService.selectMenu());
		model.addAttribute("menuVideo", "video5");
		model.addAttribute("menuName", "팀 목록");
		return "logPage/team/team_detail";
	}
	
	// 팀관리 팀원조회
	@GetMapping("/selectTeamMemberManage")
	public String selectTeamMemberManage(HttpSession session, Model model, String menuVideo, String menuName) {
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		String teamAdmin = ((MemberVO)session.getAttribute("loginInfo")).getTeamAdmin();
		model.addAttribute("myTeam", teamService.teamManage(teamCode));
		model.addAttribute("memberList",teamService.selectTeamMemberManage(teamCode));
		model.addAttribute("applyMember",teamService.selectApplyMember(teamCode));
		model.addAttribute("teamAdmin",teamAdmin);
		model.addAttribute("menuList", menuService.selectMenu());
		model.addAttribute("menuVideo", "video3");
		model.addAttribute("menuName", "나의팀");
		return "myTeamLayout/team/submenu_team_manage";
	}
	
	// 팀관리 -> 팀원조회 -> 팀원상세 조회
	@GetMapping("/teamMemberDetail")
	public String teamMemberDetail(String memberCode, Model model, HttpSession session, String menuVideo, String menuName) {
		String teamAdmin = ((MemberVO)session.getAttribute("loginInfo")).getTeamAdmin();
		model.addAttribute("memberDetail",teamService.selectTeamMemberDetail(memberCode));
		model.addAttribute("teamAdmin",teamAdmin);
		model.addAttribute("menuList", menuService.selectMenu());
		model.addAttribute("menuVideo", "video3");
		model.addAttribute("menuName", "나의팀");
		return "logPage/team/team_member_detail";
	}
	
	// 팀가입 신청
	@GetMapping("/insertTeamApply")
	public String insertTeamApply(TeamApplyVO teamApplyVO, Model model, HttpSession session) {
		
		if(teamService.teamApplyCheck(teamApplyVO) == null) {
			
			teamService.insertTeamApply(teamApplyVO);
			model.addAttribute("msg", "신청 완료되었습니다");
			model.addAttribute("url", "selectTeamList");
			
			
			return "team/alert";
			
		}
		else {
			
			model.addAttribute("msg", "이미 신청 되었습니다");
			model.addAttribute("url", "selectTeamList");
			
			
			return "team/alert";
		}
			
	}
	// 팀가입 승인
	@GetMapping("/teamApplyApproval")
	public String teamApplyApproval(TeamVO teamVO, HttpSession session, Model model) {
		
		
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		teamVO.setTeamCode(teamCode);
		
		teamService.teamApplyApproval(teamVO);
		model.addAttribute("msg", "가입이 승인되었습니다..");
		model.addAttribute("url", "selectTeamMemberManage");
		
		
		return "team/alert";
	}
	// 팀가입 거절
	@GetMapping("/teamApplyReject")
	public String teamApplyReject(TeamVO teamVO, HttpSession session, Model model) {
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		teamVO.setTeamCode(teamCode);
		
		teamService.teamApplyReject(teamVO);
		model.addAttribute("msg", "가입신청이 거절되었습니다.");
		model.addAttribute("url", "selectTeamMemberManage");
		return "team/alert";
	}
	
	// 팀멤버 강퇴
	@GetMapping("/teamMemberDelete")
	public String teamMemberDelete(TeamVO teamVO, HttpSession session, Model model) {
		
		teamService.teamMemberDelete(teamVO);
		model.addAttribute("msg", "강퇴 완료 되었습니다.");
		model.addAttribute("url", "selectTeamMemberManage");
		return "team/alert";
	}
	
	// 팀 이름 중복확인
	@ResponseBody
	@PostMapping("/checkTeamName")
	public boolean checkTeamName(String teamName) {
		
		return teamService.checkTeamName(teamName);
		
	}
	
	// 매치관리 페이지 이동
	@GetMapping("/myMatchManage")
	public String myMatchManage(HttpSession session, Model model, String menuVideo, String menuName) {
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		model.addAttribute("myTeam", teamService.teamManage(teamCode));
		model.addAttribute("matchAfterManage", teamService.myAfterMatchManage(teamCode));
		model.addAttribute("matchBeforeManage", teamService.myBeforeMatchManage(teamCode));
		model.addAttribute("menuList", menuService.selectMenu());
		model.addAttribute("menuVideo", "video3");
		model.addAttribute("menuName", "나의 팀");
		return "myTeamLayout/team/myTeam_match_manage";
	}
	
	// 개인 회원 팀 탈퇴
	@GetMapping("/myTeamDelete")
	public String myTeamDelete(HttpSession session) {
		String memberCode = ((MemberVO)session.getAttribute("loginInfo")).getMemberCode();
		TeamVO teamVO = new TeamVO();
		teamVO.setMemberCode(memberCode);
		teamService.teamMemberDelete(teamVO);
		session.setAttribute("loginInfo", memberService.selectMemberInfo(memberCode));
		return "redirect:/team/selectTeamList";
	}
	
	
	
}










