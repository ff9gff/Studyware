package edu.spring.studyware.register.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.studyware.domain.ApplyVO;
import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.domain.RecruitDTO;
import edu.spring.studyware.domain.RecruitTypeVO;
import edu.spring.studyware.domain.RecruitVO;
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

	@Override
	public List<RecruitTypeVO> recruitTypeName() {
		return sqlSession.selectList(NAMESPACE + ".studyTypeList");
	}

	@Override
	public int recruitTypeNo(String recruitType) {
		return sqlSession.selectOne(NAMESPACE + ".studyTypeNo", recruitType);
	}

	@Override
	public int recruitCateNo(String studyCate) {
		return sqlSession.selectOne(NAMESPACE + ".studyCateNo", studyCate);
	}

	@Override
	public int insertRecruit(RecruitVO recruitVO) {
		return sqlSession.insert(NAMESPACE + ".insertRecruit", recruitVO);
	}

	@Override
	public List<RecruitVO> recruitDetail() {
		return sqlSession.selectList(NAMESPACE + ".defaultRecruitList");
	}
	
	@Override
	public List<RecruitDTO> selectRecruitProgress(int member_no) {
		System.out.println("studyCreate Service: "+member_no);
		return sqlSession.selectList(NAMESPACE + ".selectRecruitProgress",member_no);
	}
	
	@Override
	public List<ApplyVO> selectApplyProgress(int member_no) {
		return sqlSession.selectList(NAMESPACE + ".selectApplyProgress",member_no);
	}

}
