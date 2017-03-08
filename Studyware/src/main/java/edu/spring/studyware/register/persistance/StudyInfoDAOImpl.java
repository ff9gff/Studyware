package edu.spring.studyware.register.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.studyware.domain.LevelNameVO;
import edu.spring.studyware.domain.LevelValueVO;
import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.domain.RecruitTypeVO;
import edu.spring.studyware.domain.RecruitVO;
import edu.spring.studyware.member.persistance.MemberDAOImpl;

@Repository
public class StudyInfoDAOImpl implements StudyInfoDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "edu.spring.studyware.StudyInfoMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(StudyInfoDAOImpl.class);

	@Override
	public RecruitVO recruitInfo(int recruit_no) {
		return sqlSession.selectOne(NAMESPACE + ".recruitInfo", recruit_no);
	}

	@Override
	public int selectLevelNameNO(int level_no) {
		return sqlSession.selectOne(NAMESPACE + ".selectLevelNameNo", level_no);
	}

	@Override
	public int selectLevelValueNO(int level_no) {
		return sqlSession.selectOne(NAMESPACE + ".selectLevelValueNo", level_no);
	}

	@Override
	public int updateLevelName(LevelNameVO levelNameVO) {
		
		if (levelNameVO.getLevel1_name() != null && levelNameVO.getLevel2_name() == null && levelNameVO.getLevel3_name() == null && levelNameVO.getLevel4_name() == null && levelNameVO.getLevel5_name() == null) {
			return sqlSession.insert(NAMESPACE + ".updateLevelName1", levelNameVO);
		} else if (levelNameVO.getLevel1_name() != null && levelNameVO.getLevel2_name() != null && levelNameVO.getLevel3_name() == null && levelNameVO.getLevel4_name() == null && levelNameVO.getLevel5_name() == null) {
			return sqlSession.insert(NAMESPACE + ".updateLevelName2", levelNameVO);
		} else if (levelNameVO.getLevel1_name() != null && levelNameVO.getLevel2_name() != null && levelNameVO.getLevel3_name() != null && levelNameVO.getLevel4_name() == null && levelNameVO.getLevel5_name() == null) {
			return sqlSession.insert(NAMESPACE + ".updateLevelName3", levelNameVO);
		} else if (levelNameVO.getLevel1_name() != null && levelNameVO.getLevel2_name() != null && levelNameVO.getLevel3_name() != null && levelNameVO.getLevel4_name() != null && levelNameVO.getLevel5_name() == null) {
			return sqlSession.insert(NAMESPACE + ".updateLevelName4", levelNameVO);
		} else {
			return sqlSession.insert(NAMESPACE + ".updateLevelName5", levelNameVO);
		}
		
	}

	@Override
	public int updateLevelValue(LevelValueVO levelValueVO) {
		
		if (levelValueVO.getLevel1_value() != null && levelValueVO.getLevel2_value() == null && levelValueVO.getLevel3_value() == null && levelValueVO.getLevel4_value() == null && levelValueVO.getLevel5_value() == null) {
			return sqlSession.insert(NAMESPACE + ".updateLevelValue1", levelValueVO);
		} else if (levelValueVO.getLevel1_value() != null && levelValueVO.getLevel2_value() != null && levelValueVO.getLevel3_value() == null && levelValueVO.getLevel4_value() == null && levelValueVO.getLevel5_value() == null) {
			return sqlSession.insert(NAMESPACE + ".updateLevelValue2", levelValueVO);
		} else if (levelValueVO.getLevel1_value() != null && levelValueVO.getLevel2_value() != null && levelValueVO.getLevel3_value() != null && levelValueVO.getLevel4_value() == null && levelValueVO.getLevel5_value() == null) {
			return sqlSession.insert(NAMESPACE + ".updateLevelValue3", levelValueVO);
		} else if (levelValueVO.getLevel1_value() != null && levelValueVO.getLevel2_value() != null && levelValueVO.getLevel3_value() != null && levelValueVO.getLevel4_value() != null && levelValueVO.getLevel5_value() == null) {
			return sqlSession.insert(NAMESPACE + ".updateLevelValue4", levelValueVO);
		} else {
			return sqlSession.insert(NAMESPACE + ".updateLevelValue5", levelValueVO);
		}


	}

	@Override
	public int updateRecruit(RecruitVO recruitVO) {
		return sqlSession.update(NAMESPACE + ".updateRecruit", recruitVO);
	}

	@Override
	public int deleteLevelName(int level_name_no) {
		return sqlSession.delete(NAMESPACE + ".deleteLevelName", level_name_no);
	}

	@Override
	public int deleteLevelValue(int level_value_no) {
		return sqlSession.delete(NAMESPACE + ".deleteLevelValue", level_value_no);
	}

	@Override
	public int deleteLevel(int level_no) {
		return sqlSession.delete(NAMESPACE + ".deleteLevel", level_no);
	}

	@Override
	public int deleteRecruit(int recruit_no) {
		return sqlSession.delete(NAMESPACE + ".deleteRecruit", recruit_no);

	}

}
