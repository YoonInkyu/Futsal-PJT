package com.kh.project.mercenary.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
		return "mercenary/mercenary_recruit";
	}
	//용병 모집 등록 페이지로 이동
	@GetMapping("/recruitRegForm")
	public String goRecruitRegForm() {
		return "mercenary/mercenary_recruit_regform";
	}
	
	
	
	//용병 구직 페이지로 이동
	@GetMapping("/apply")
	public String goMercenaryApply() {
		return "mercenary/mercenary_apply";
	}
	
}
