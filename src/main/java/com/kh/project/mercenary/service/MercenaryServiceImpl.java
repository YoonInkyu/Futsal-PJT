package com.kh.project.mercenary.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.team.vo.TeamVO;

//윤인규, 1020 작성
@Service("mercenaryService")
public class MercenaryServiceImpl implements MercenaryService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	
	
}
