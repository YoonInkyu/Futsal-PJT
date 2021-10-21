package com.kh.project.mercenary.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.mercenary.service.MercenaryService;

// 윤인규, 1020 작성
@Controller
@RequestMapping("/mercenary")
public class MercenaryController {
	@Resource(name = "mercenaryService")
	private MercenaryService mercenaryService;
	
	//용병 구인 페이지로 이동
	@GetMapping("/recruit")
	public String goMercenaryRecruit() {
		//리스트 셀렉트 필요
		
		return "mercenary/mercenary_recruit";
	}
	//용병 모집(구인) 등록 페이지로 이동
	@GetMapping("/recruitRegForm")
	public String goRecruitRegForm() {
		return "mercenary/mercenary_recruit_regform";
	}
	//용병 모집(구인) 등록
	@PostMapping("/recruitReg")
	public String recruitRegBoard() {
		//데이터 처리 필요함.
		
		//용병 구인 리스트 페이지로 이동
		return "redirect:/mercenary/recruit";
	}
	//용병 구직 페이지로 이동
	@GetMapping("/apply")
	public String goMercenaryApply() {
		//리스트 셀렉트 필요
		
		return "mercenary/mercenary_apply";
	}
	//용병 신청(구직) 등록 페이지로 이동
	@GetMapping("/applyRegForm")
	public String goApplyRegForm() {
		return "mercenary/mercenary_apply_regform";
	}
	//용병 신청(구직) 등록
	@PostMapping("/applyReg")
	public String applyRegBoard() {
		//데이터 처리 필요함.
		
		//용병 구직 리스트 페이지로 이동
		return "redirect:/mercenary/apply";
	}
	
}
