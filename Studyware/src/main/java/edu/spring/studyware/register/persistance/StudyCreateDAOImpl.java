package edu.spring.studyware.register.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.member.persistance.MemberDAOImpl;

@Repository
public class StudyCreateDAOImpl implements StudyCreateDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "edu.spring.studyware.StudyCreateMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(StudyCreateDAOImpl.class);

	@Override
	public List<RecruitCateVO> recruitCateName() {
		return sqlSession.selectList(NAMESPACE + ".studyCateList");
	}
	

}
