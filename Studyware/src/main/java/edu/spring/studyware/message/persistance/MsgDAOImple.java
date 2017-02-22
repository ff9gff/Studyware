package edu.spring.studyware.message.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.studyware.domain.msgVO;
@Repository
public class MsgDAOImple implements MsgDAO {

	private static final String NAMESPACE = "edu.spring.studyware.msgMapper";
	private static final Logger logger = LoggerFactory.getLogger(MsgDAOImple.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(msgVO vo) {
		logger.info("insert()");
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}

	@Override
	public List<msgVO> select(int member_no) {
		logger.info("select(): member_no="+member_no);
		return sqlSession.selectList(NAMESPACE+".select",member_no);
	}

	@Override
	public int update(int msg_no) {
		logger.info("update(): msg_no:"+msg_no);
		return sqlSession.update(NAMESPACE+".update",msg_no);
	}

	@Override
	public int delete(int msg_no) {
		logger.info("delete(): msg_no:"+msg_no);
		return sqlSession.delete(NAMESPACE+".delete",msg_no);
	}

}
