package edu.spring.studyware.register.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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

	

}
