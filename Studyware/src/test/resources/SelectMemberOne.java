import java.util.logging.Logger;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.studyware.domain.MemberVO;
import edu.spring.studyware.member.persistance.MemberDAO;
import edu.spring.studyware.member.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class SelectMemberOne {

	private static final Logger logger=
			LoggerFactory.getLogger(SelectMemberOne.class);

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private SqlSession SqlSession;
	
	@Autowired
	private MemberDAO dao;
	
	
	@Test
	public void testlogin(){
	//	MemberVO vo=new MemberVO(0, "ddd", "1014",null);
			MemberVO vo=memberDAO.memberSelectOne("test1");	
		String pwd=	vo.getPwd();
			logger.info("비번:"+pwd);
			
			/*		MemberVO result=dao.login(vo);
		if(result!=null){
			
			logger.info("로그인성공");
			logger.info("result id"+result.getUserid());
			logger.info("result pwd"+result.getPwd());
			
		}else{
			logger.info("로그인실패");
		}
		

	}*/
}
