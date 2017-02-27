package edu.spring.studyware.register.persistance;

import java.util.List;

import edu.spring.studyware.domain.LevelNameVO;
import edu.spring.studyware.domain.LevelValueVO;

//공부수준 테스트용 DAO입니다.
//테스트 후 삭제할 예정입니다.

import edu.spring.studyware.domain.TestLevelVO;

public interface TestLevelDAO {

	// 1. 레벨 리스트(상,중,하) 가져오기
	public abstract List<TestLevelVO> levelList();

	// 2. 공부 내용 Insert
	public abstract int insertLevelName(LevelNameVO levelNameVO);

	// 3. 공부 수준 Insert
	public abstract int insertLevelValue(LevelValueVO levelValueVO);
	
}
