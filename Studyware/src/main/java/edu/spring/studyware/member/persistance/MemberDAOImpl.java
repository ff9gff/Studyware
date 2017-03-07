package edu.spring.studyware.member.persistance;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.MemberDTO;
import edu.spring.studyware.domain.MemberNickDTO;
import edu.spring.studyware.domain.MemberVO;
import edu.spring.studyware.domain.Region2VO;
import edu.spring.studyware.domain.Region1VO;

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
	public List<Region1VO> memberRegionDepth1() {
		return sqlSession.selectList(NAMESPACE + ".memberRegion1");
	}
	
	@Override
	public List<Region2VO> memberRegionDepth2(String region1) {
		return sqlSession.selectList(NAMESPACE + ".memberRegion2", region1);
	}

	@Override
	public int memberRegionNo(Region1VO region1vo) {
		return sqlSession.selectOne(NAMESPACE + ".memberRegionNo", region1vo);
	}

	@Override
	public int memberSignUp(MemberVO memberVO) {
		return sqlSession.insert(NAMESPACE + ".memberSignUp", memberVO);
	}
	
	@Override
	public List<MemberDTO> selectList() {
		return sqlSession.selectList(NAMESPACE + ".memberDTOList");
	}
	
	@Override
	public int updateAuth(int member_no, int member_auth_no) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("member_no", member_no);
		map.put("member_auth_no", member_auth_no);
		return sqlSession.update(NAMESPACE + ".memberAuth", map);
	}
	
	@Override
	public List<MemberNickDTO> selectNicklist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".memberSelectNick");
	}

	
	
	@Override
	public MemberVO memberSelectOne(String userid) {
		MemberVO vo=sqlSession.selectOne(NAMESPACE+".memberSelectOne",userid);
		return vo;
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		return sqlSession.selectOne(NAMESPACE + ".login", memberVO);
	}
}
