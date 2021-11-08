package com.kh.project.menu.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.menu.vo.MenuVO;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 메뉴 리스트 조회
	@Override
	public List<MenuVO> selectMenu() {
		return sqlSession.selectList("menuMapper.selectMenu");
	}

}
