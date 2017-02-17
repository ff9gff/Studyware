package edu.spring.studyware.member.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import edu.spring.studyware.member.domain.RegionVO;

/**
 * Handles requests for the application home page.
 */
@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final String NAMESPACE = "edu.spring.studyware.MemberMapper";

	// DB insert/update/delete/select 동작들은
	// SqlSession 객체를 사용해서 이루어지게 됨
	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);

	@Override
	public List<RegionVO> memberRegion() {
		return sqlSession.selectList(NAMESPACE + ".memberRegion");
	}

}
