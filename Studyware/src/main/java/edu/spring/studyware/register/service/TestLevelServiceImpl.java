package edu.spring.studyware.register.service;

import java.util.List;

//공부수준 테스트용 ServiceImpl입니다.
//테스트 후 삭제할 예정입니다.

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.TestLevelVO;
import edu.spring.studyware.register.persistance.TestLevelDAO;

@Service
public class TestLevelServiceImpl implements TestLevelService {
	
	@Autowired
	private TestLevelDAO testLevelDAO;

	@Override
	public List<TestLevelVO> levelList() {
		return testLevelDAO.levelList();
	}

}
