package edu.spring.studyware.register.service;

import java.util.List;

//공부수준 테스트용 Service입니다.
//테스트 후 삭제할 예정입니다.

import edu.spring.studyware.domain.TestLevelVO;

public interface TestLevelService {
	
	// 1. 레벨 리스트(상,중,하) 가져오기
	public abstract List<TestLevelVO> levelList();

}
