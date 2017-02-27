package edu.spring.studyware.register.persistance;

import java.util.List;

//공부수준 테스트용 DAOImpl입니다.
//테스트 후 삭제할 예정입니다.

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.studyware.domain.LevelNameVO;
import edu.spring.studyware.domain.LevelVO;
import edu.spring.studyware.domain.LevelValueVO;
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

	@Override
	public int insertLevelName(LevelNameVO levelNameVO) {
		return sqlSession.insert(NAMESPACE + ".insertlevelName", levelNameVO);
	}

	@Override
	public int insertLevelValue(LevelValueVO levelValueVO) {
		return sqlSession.insert(NAMESPACE + ".insertlevelValue", levelValueVO);

	}

	@Override
	public int insertNameValueNO(LevelVO levelVO) {
		return sqlSession.insert(NAMESPACE + ".insertNameValueNo", levelVO);
	}

}
