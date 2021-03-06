package com.kh.project.mercenary.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.common.util.CurrentDateTime;
import com.kh.project.common.util.MessageService;
import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;
import com.kh.project.menu.service.MenuService;
import com.kh.project.mercenary.service.MercenaryService;
import com.kh.project.mercenary.vo.MercenaryListVO;
import com.kh.project.mercenary.vo.MercenaryVO;

// 윤인규, 1020 작성
// 윤인규, 1025 detail에서 지원, 수정 기능 구현중
// 수정 윤인규, 1026 구인구직 테이블 합쳐서 db, vo, mapper, service, serviceimpl, controller 모두 수정함.
@Controller
@RequestMapping("/mercenary")
public class MercenaryController {
	@Resource(name = "mercenaryService")
	private MercenaryService mercenaryService;
	@Resource(name = "memberService")
	private MemberService memberService;
	@Resource(name = "menuService")
	private MenuService menuService;
	
	//용병 구인구직 페이지로 이동
	@GetMapping("/recruit")
	public String goMercenaryRecruit(Model model, MercenaryVO mercenaryVO, HttpSession session, String menuVideo, String menuName) {
		Object result = session.getAttribute("loginInfo");
		if(result == null) {
			//전체 데이터 수
			int dataCnt = mercenaryService.selectMercCnt(mercenaryVO);
			mercenaryVO.setTotalCnt(dataCnt);
			//페이징 처리
			mercenaryVO.setPageInfo();
			//구인구직 리스트 셀렉트
			model.addAttribute("mercBoardList", mercenaryService.selectMercBoardList(mercenaryVO));
			model.addAttribute("menuList", menuService.selectMenu());
			model.addAttribute("menuVideo", "video2");
			model.addAttribute("menuName", "용병 구인");
		}
		else {
			String memberCode = ((MemberVO)session.getAttribute("loginInfo")).getMemberCode();
			//전체 데이터 수
			int dataCnt = mercenaryService.selectMercCnt(mercenaryVO);
			mercenaryVO.setTotalCnt(dataCnt);
			//페이징 처리
			mercenaryVO.setPageInfo();
			//구인구직 리스트 셀렉트
			mercenaryVO.setMemberCode(memberCode);
			model.addAttribute("mercBoardList", mercenaryService.selectMercBoardList(mercenaryVO));
			model.addAttribute("menuList", menuService.selectMenu());
			model.addAttribute("menuVideo", "video2");
			model.addAttribute("menuName", "용병 구인");
		}
		return "mercenary/mercenary_recruit";
	}
	//검색 조건식 사용시 용병 구인구직 리스트 조회
	@PostMapping("/recruit")
	public String goMercenaryRecruit2(Model model, MercenaryVO mercenaryVO, HttpSession session, String menuVideo, String menuName) {
		Object result = session.getAttribute("loginInfo");
		if(result == null) {
			//전체 데이터 수
			int dataCnt = mercenaryService.selectMercCnt(mercenaryVO);
			mercenaryVO.setTotalCnt(dataCnt);
			//페이징 처리
			mercenaryVO.setPageInfo();
			//구인구직 리스트 셀렉트
			model.addAttribute("mercBoardList", mercenaryService.selectMercBoardList(mercenaryVO));
			model.addAttribute("menuList", menuService.selectMenu());
			model.addAttribute("menuVideo", "video2");
			model.addAttribute("menuName", "용병 구인");
		}
		else {
			String memberCode = ((MemberVO)session.getAttribute("loginInfo")).getMemberCode();
			//전체 데이터 수
			int dataCnt = mercenaryService.selectMercCnt(mercenaryVO);
			mercenaryVO.setTotalCnt(dataCnt);
			//페이징 처리
			mercenaryVO.setPageInfo();
			//구인구직 리스트 셀렉트
			mercenaryVO.setMemberCode(memberCode);
			model.addAttribute("mercBoardList", mercenaryService.selectMercBoardList(mercenaryVO));
			model.addAttribute("menuList", menuService.selectMenu());
			model.addAttribute("menuVideo", "video2");
			model.addAttribute("menuName", "용병 구인");
		}
		return "mercenary/mercenary_recruit";
	}
	//용병 구인구직 상세보기 (모달)
	@GetMapping("/recruitDetail")
	public String recruitDetail(Model model, String mercBoardCode, MercenaryListVO mercenaryListVO, HttpSession session) {
		Object result = session.getAttribute("loginInfo");
		//로그인 여부 확인
		if(result == null) {
			//구인 상세보기 조회
			model.addAttribute("mercVO", mercenaryService.selectMercDetail(mercBoardCode));
			//신청자 리스트 조회
			model.addAttribute("mercList", mercenaryService.selectMercRecruitList(mercenaryListVO));
		}
		else {
			String memberCode = ((MemberVO)session.getAttribute("loginInfo")).getMemberCode();
			//구인 상세보기 조회
			model.addAttribute("mercVO", mercenaryService.selectMercDetail(mercBoardCode));
			//신청자 리스트 조회
			mercenaryListVO.setMemberCode(memberCode);
			model.addAttribute("mercList", mercenaryService.selectMercRecruitList(mercenaryListVO));
		}
		//상세보기 모달창 사이드,푸터 없애기 위해 리턴값에 logPage/ 추가 
		return "logPage/mercenary/mercenary_recruit_detail";
	}
	//상세보기 수정 ajax처리
	@ResponseBody
	@PostMapping("/recruitDetailAjax")
	public MercenaryVO recruitDetailAjax(String mercBoardCode) {
		//상세보기 데이터 ajax에 reusult 값으로 넘김
		return mercenaryService.selectMercDetail(mercBoardCode);
	}
	//상세보기 수정
	@PostMapping("/detailUpdate")
	public String detailUpdate(MercenaryVO mercenaryVO, Model model) {
		//ajax에서 submit 한 데이터 업데이트
		mercenaryService.updateMercBoard(mercenaryVO);
		model.addAttribute("msg", "수정 되었습니다.");
		model.addAttribute("url", "recruit");
		return "mercenary/alert";
	}
	//용병 구인구직 등록 페이지로 이동
	@GetMapping("/recruitRegForm")
	public String goRecruitRegForm(Model model, HttpSession session, String menuVideo, String menuName) {
		MemberVO memberCode = (MemberVO)session.getAttribute("loginInfo");
		if(memberCode == null) {
			model.addAttribute("msg", "로그인해야 등록 가능 합니다.");
			model.addAttribute("url", "/member/goLogin");
			return "mercenary/alert";
		}
		model.addAttribute("today", CurrentDateTime.today());
		model.addAttribute("time", CurrentDateTime.nowTime());
		model.addAttribute("menuList", menuService.selectMenu());
		model.addAttribute("menuVideo", "video2");
		model.addAttribute("menuName", "용병 구인");
		return "mercenary/mercenary_recruit_regform";
	}
	//용병 구인구직 등록
	@PostMapping("/recruitReg")
	public String recruitRegBoard(HttpSession session, MercenaryVO mercenaryVO, Model model) {
		//로그인 정보 가져와서 VO에 set
		String memberCode = ((MemberVO)session.getAttribute("loginInfo")).getMemberCode();
		mercenaryVO.setMemberCode(memberCode);
		String memberName = ((MemberVO)session.getAttribute("loginInfo")).getMemberName();
		mercenaryVO.setMercBoardWriter(memberName);
		String teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
		mercenaryVO.setTeamCode(teamCode);
		
		//게시글 등록 쿼리 실행
		mercenaryService.insertMercBoard(mercenaryVO);
		
		//용병 구인 리스트 페이지로 이동
		return "redirect:/mercenary/recruit";
	}
	//용병 구인구직 신청하기
	@GetMapping("/updateRecruitCnt")
	public String updateRecruitCnt(Model model, MercenaryVO mercenaryVO, HttpSession session, String memberTell, MercenaryListVO mercenaryListVO) {
		MemberVO memberCode = (MemberVO)session.getAttribute("loginInfo");
		if(memberCode == null) {
			model.addAttribute("msg", "로그인해야 신청 가능 합니다.");
			model.addAttribute("url", "/member/goLogin");
			return "mercenary/alert";
		}
		
		//신청가능 여부 확인
		boolean result = mercenaryService.checkMercApply(mercenaryListVO);
		
		System.out.println("신청가능해??");
		System.out.println(result);
		
		//신청가능 하면 insert
		if(result == true) {
			mercenaryService.insertMercList(mercenaryVO);
			//신청 성공시 작성자에게 문자 전송
			String content = "[FootBall] 용병 신청이 도착했습니다. 홈페이지에서 확인해 주세요";
			MessageService.sendMessage(memberTell, content);
			
			model.addAttribute("msg", "용병 신청이 완료되었습니다.");
			model.addAttribute("url", "recruit");
			return "mercenary/alert";
		}
		//신청이 이미 된 용병글이면 alert
		else if(result == false) {
			model.addAttribute("msg", "이미 신청한 용병 구인구직 게시글 입니다.");
			model.addAttribute("url", "recruit");
			return "mercenary/alert";
		}
		return "redirect:/mercenary/recruit";
	}
	//용병 구인구직 수락
	@GetMapping("/updateResponse")
	public String updateResponse(MercenaryListVO mercenaryListVO, Model model) {
		mercenaryService.updateResponse(mercenaryListVO);
		model.addAttribute("msg", "용병을 수락했습니다.");
		model.addAttribute("url", "recruit");
		return "mercenary/alert";
	}
	//용병 구인구직 삭제
	@GetMapping("/deleteMerc")
	public String deleteMerc(String mercBoardCode, Model model) {
		mercenaryService.deleteMerc(mercBoardCode);
		model.addAttribute("msg", "삭제 되었습니다.");
		model.addAttribute("url", "recruit");
		return "mercenary/alert";
	}
}
