package edu.spring.studyware.register.service;

import java.util.List;

import edu.spring.studyware.domain.TestLevelVO;

public interface TestLevelService {
	
	// 1. 레벨 리스트(상,중,하) 가져오기
	public abstract List<TestLevelVO> levelList();

}
