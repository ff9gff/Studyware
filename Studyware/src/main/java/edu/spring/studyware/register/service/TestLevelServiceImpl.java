package edu.spring.studyware.register.service;

import java.util.List;

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
