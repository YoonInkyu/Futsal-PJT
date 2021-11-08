package com.kh.project.menu.service;

import java.util.List;

import com.kh.project.menu.vo.MenuVO;

public interface MenuService {

	//메뉴 리스트 조회
	List<MenuVO> selectMenu();
}
