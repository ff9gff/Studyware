package edu.spring.studyware.register.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.studyware.domain.TestLevelVO;

@Repository
public class TestLevelDAOImpl implements TestLevelDAO {

	private static final String NAMESPACE = "edu.spring.studyware.StudyCreateMapper";

	private static final Logger logger = LoggerFactory.getLogger(StudyCreateDAOImpl.class);

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TestLevelVO> levelList() {
		return sqlSession.selectList(NAMESPACE + ".levelList");
	}

}
