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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;
import com.kh.project.team.service.TeamService;
import com.kh.project.team.vo.TeamLogoImgVO;
import com.kh.project.team.vo.TeamVO;

@Controller
@RequestMapping("/team")
public class TeamController {
	@Resource(name = "teamService")
	private TeamService teamService;
	
	// 팀생성 페이지로 이동
	@GetMapping("/regTeam")
	public String goRegTeam() {
		return "team/submenu_team_create";
	} 
	
	/*
	 * // 나의팀 관리
	 * 
	 * @GetMapping("/teamManage") public String teamManage_admin(HttpSession
	 * session, Model model) { session.getAttribute("loginInfo"); String teamCode =
	 * ((MemberVO)session.getAttribute("loginInfo")).getMemberCode();
	 * model.addAttribute("member",MemberServicece.myPage(memberCode));
	 * 
	 * return "team/team_manage"; }
	 */
	
	
	// 팀 생성
	@PostMapping("/regTeam")
	public String regTeam(TeamVO teamVO, MultipartHttpServletRequest multi, HttpSession session) {
		
		//파일이 첨부되는 input 태그의 name 속성 값 가져오는 객체
		//Iterator<String> inputName = multi.getFileNames();
		
		// 첨부될 폴더 경로 지정
		String uploadPath = "C:\\Users\\User\\git\\ProjectTest\\src\\main\\webapp\\resources\\img\\";
		
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
		
		return "mainPage/main_page";
	}
	
	// 팀 리스트 조회 
	@GetMapping("/selectTeamList")
	public String selectTeamList(Model model) {
		model.addAttribute("teamList", teamService.selectTeamList());
	return "team/submenu_team_list";
	}
	
}
