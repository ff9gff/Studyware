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
import edu.spring.studyware.domain.LevelListVO;

@Repository
public class TestLevelDAOImpl implements TestLevelDAO {

	private static final String NAMESPACE = "edu.spring.studyware.StudyCreateMapper";

	private static final Logger logger = LoggerFactory.getLogger(StudyCreateDAOImpl.class);

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<LevelListVO> levelList() {
		return sqlSession.selectList(NAMESPACE + ".levelList");
	}

	@Override
	public int insertLevelName(LevelNameVO levelNameVO) {
		
		if (levelNameVO.getLevel1_name() != null && levelNameVO.getLevel2_name() == null && levelNameVO.getLevel3_name() == null && levelNameVO.getLevel4_name() == null && levelNameVO.getLevel5_name() == null) {
			return sqlSession.insert(NAMESPACE + ".insertlevelName1", levelNameVO);
		} else if (levelNameVO.getLevel1_name() != null && levelNameVO.getLevel2_name() != null && levelNameVO.getLevel3_name() == null && levelNameVO.getLevel4_name() == null && levelNameVO.getLevel5_name() == null) {
			return sqlSession.insert(NAMESPACE + ".insertlevelName2", levelNameVO);
		} else if (levelNameVO.getLevel1_name() != null && levelNameVO.getLevel2_name() != null && levelNameVO.getLevel3_name() != null && levelNameVO.getLevel4_name() == null && levelNameVO.getLevel5_name() == null) {
			return sqlSession.insert(NAMESPACE + ".insertlevelName3", levelNameVO);
		} else if (levelNameVO.getLevel1_name() != null && levelNameVO.getLevel2_name() != null && levelNameVO.getLevel3_name() != null && levelNameVO.getLevel4_name() != null && levelNameVO.getLevel5_name() == null) {
			return sqlSession.insert(NAMESPACE + ".insertlevelName4", levelNameVO);
		} else {
			return sqlSession.insert(NAMESPACE + ".insertlevelName5", levelNameVO);
		}
		
	}

	@Override
	public int insertLevelValue(LevelValueVO levelValueVO) {
		
		if (levelValueVO.getLevel1_value() != null && levelValueVO.getLevel2_value() == null && levelValueVO.getLevel3_value() == null && levelValueVO.getLevel4_value() == null && levelValueVO.getLevel5_value() == null) {
			return sqlSession.insert(NAMESPACE + ".insertlevelValue1", levelValueVO);
		} else if (levelValueVO.getLevel1_value() != null && levelValueVO.getLevel2_value() != null && levelValueVO.getLevel3_value() == null && levelValueVO.getLevel4_value() == null && levelValueVO.getLevel5_value() == null) {
			return sqlSession.insert(NAMESPACE + ".insertlevelValue2", levelValueVO);
		} else if (levelValueVO.getLevel1_value() != null && levelValueVO.getLevel2_value() != null && levelValueVO.getLevel3_value() != null && levelValueVO.getLevel4_value() == null && levelValueVO.getLevel5_value() == null) {
			return sqlSession.insert(NAMESPACE + ".insertlevelValue3", levelValueVO);
		} else if (levelValueVO.getLevel1_value() != null && levelValueVO.getLevel2_value() != null && levelValueVO.getLevel3_value() != null && levelValueVO.getLevel4_value() != null && levelValueVO.getLevel5_value() == null) {
			return sqlSession.insert(NAMESPACE + ".insertlevelValue4", levelValueVO);
		} else {
			return sqlSession.insert(NAMESPACE + ".insertlevelValue5", levelValueVO);
		}

	}

	@Override
	public int insertNameValueNO(LevelVO levelVO) {
		return sqlSession.insert(NAMESPACE + ".insertNameValueNo", levelVO);
	}

}
