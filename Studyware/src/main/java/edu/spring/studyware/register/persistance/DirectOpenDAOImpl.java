package edu.spring.studyware.register.persistance;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.studyware.domain.MemberVO;

@Repository
public class DirectOpenDAOImpl implements DirectOpenDAO {
	
	private static final String NAMESPACE = "edu.spring.studyware.DirectOpenMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(DirectOpenDAOImpl.class);

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO memberSearch(String id) {
		return sqlSession.selectOne(NAMESPACE + ".memberSearch", id);
	}

}
